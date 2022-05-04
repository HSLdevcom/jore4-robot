INSERT INTO route.line
  (line_id,name_i18n,short_name_i18n,primary_vehicle_mode,label,type_of_line,transport_target,priority,validity_start,validity_end)
VALUES
  ('faa23d33-8a0f-4a9c-aa35-b9e92fd4167c','Veräjälaakso - Rautatientori','Veräjälaakso - Rautatientori','bus','66','regional_bus_service','helsinki_internal_traffic',10,'2021-01-01','2023-12-13'),
  ('9058c328-efdd-412c-9b2b-37b0f6a2c6fb','Rautatientori - Malmi as.','Rautatientori - Malmi as.','bus','71','regional_bus_service','helsinki_internal_traffic',10,'2021-01-01','2023-12-13'),
  ('bbd1cb29-74c3-4fa1-ac86-918d7fa96fe2','Rautatientori - Nikkilä','Rautatientori - Nikkilä','bus','785K','regional_bus_service','helsinki_internal_traffic',10,'2021-01-01','2023-12-13'),
  ('db748c5c-42e3-429f-baa0-e0db227dc2c8','Erottaja - Arkkadiankatu','Erottaja - Arkkadiankatu','bus','1234','regional_bus_service','helsinki_internal_traffic',10,'2021-01-01','2023-12-13')
ON CONFLICT DO NOTHING;

-- to avoid constraint conflicts, inserting scheduled_stop_points and their allowed vehicle modes at the same time, within a transaction
DO $$
BEGIN
  INSERT INTO internal_service_pattern.scheduled_stop_point
    (scheduled_stop_point_id,measured_location,located_on_infrastructure_link_id,direction,label,validity_start,validity_end,priority)
  VALUES
    ('e3528755-711f-4e4f-9461-7931a2c4bc6d'::uuid,'SRID=4326;POINT Z(24.928326557825727 60.16391811339392 0)'::geography,'c63b749f-5060-4710-8b07-ec9ac017cb5f'::uuid,'bidirectional','H1234','2021-01-01','2023-12-13',10),
    ('4d294d62-df17-46ff-9248-23f66f17fa87'::uuid,'SRID=4326;POINT Z(24.930490150380855 60.164635254660325 0)'::geography,'2feba2ae-c7af-4034-a299-9e592e67358f'::uuid,'bidirectional','H1235','2021-01-01','2023-12-13',10),
	  ('f8eace87-7901-4438-bfee-bb6f24f1c4c4'::uuid,'SRID=4326;POINT Z(24.933251767757206 60.16565505738068 0)'::geography,'d3ed9fcf-d1fa-419a-a279-7ad3ffe47714'::uuid,'bidirectional','H1236','2021-01-01','2023-12-13',10)
  ON CONFLICT DO NOTHING;

  INSERT INTO service_pattern.vehicle_mode_on_scheduled_stop_point
    (scheduled_stop_point_id,vehicle_mode)
  VALUES
    ('e3528755-711f-4e4f-9461-7931a2c4bc6d','bus'),
    ('4d294d62-df17-46ff-9248-23f66f17fa87','bus'),
    ('f8eace87-7901-4438-bfee-bb6f24f1c4c4','bus')
  ON CONFLICT DO NOTHING;
END $$;

INSERT INTO internal_route.route
  (route_id,description_i18n,starts_from_scheduled_stop_point_id,ends_at_scheduled_stop_point_id,on_line_id,validity_start,validity_end,priority,label,direction)
VALUES
	('1ae0b5a9-e94f-4dd1-8dea-a7315e639b2a'::uuid,'Reitti A - B','e3528755-711f-4e4f-9461-7931a2c4bc6d'::uuid,'f8eace87-7901-4438-bfee-bb6f24f1c4c4'::uuid,'faa23d33-8a0f-4a9c-aa35-b9e92fd4167c'::uuid,'2021-01-01','2023-12-13',10,'66x','outbound')
ON CONFLICT DO NOTHING;

INSERT INTO route.infrastructure_link_along_route
  (route_id,infrastructure_link_id,infrastructure_link_sequence,is_traversal_forwards)
VALUES
  ('1ae0b5a9-e94f-4dd1-8dea-a7315e639b2a'::uuid,'c63b749f-5060-4710-8b07-ec9ac017cb5f'::uuid,0,true),
  ('1ae0b5a9-e94f-4dd1-8dea-a7315e639b2a'::uuid,'2feba2ae-c7af-4034-a299-9e592e67358f'::uuid,1,true),
  ('1ae0b5a9-e94f-4dd1-8dea-a7315e639b2a'::uuid,'d3ed9fcf-d1fa-419a-a279-7ad3ffe47714'::uuid,2,true)
ON CONFLICT DO NOTHING;

INSERT INTO journey_pattern.journey_pattern
  (journey_pattern_id, on_route_id)
VALUES
  ('9ab1b515-07dc-4755-8556-403de0f924d0','1ae0b5a9-e94f-4dd1-8dea-a7315e639b2a')
ON CONFLICT DO NOTHING;

INSERT INTO journey_pattern.scheduled_stop_point_in_journey_pattern
  (journey_pattern_id, scheduled_stop_point_id, scheduled_stop_point_sequence, is_timing_point, is_via_point)
VALUES
  ('9ab1b515-07dc-4755-8556-403de0f924d0','e3528755-711f-4e4f-9461-7931a2c4bc6d', 0, FALSE, FALSE),
  ('9ab1b515-07dc-4755-8556-403de0f924d0','f8eace87-7901-4438-bfee-bb6f24f1c4c4', 1, FALSE, FALSE)
ON CONFLICT DO NOTHING;
