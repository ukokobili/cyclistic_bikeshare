-- Data Preparation and Storage for creating table for the 12 columns--

CREATE TABLE public."202103_tripdata"
(
    ride_id text,
    rideable_type text,
    started_at timestamp with time zone,
    ended_at timestamp with time zone,
    start_station_name text,
    start_station_id text,
    end_station_name text,
    end_station_id text,
    start_lat numeric,
    start_lng numeric,
    end_lat numeric,
    end_lng numeric,
    member_casual text
);

ALTER TABLE public."202103_tripdata"
    OWNER to postgres;