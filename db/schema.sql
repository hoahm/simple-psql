CREATE TABLE IF NOT EXISTS campaigns (
    id SERIAL NOT NULL,
    name varchar(255),
    PRIMARY KEY (id)
);

INSERT INTO campaigns (name) VALUES ('Campaign 0'), ('Campaign 1'), ('Campaign 2'), ('Campaign 3'), ('Campaign 4'), ('Campaign 5'), ('Campaign 6'), ('Campaign 7'), ('Campaign 8'), ('Campaign 9');

CREATE TABLE IF NOT EXISTS leads (
    id SERIAL NOT NULL,
    campaign_id int,
    telco_lead_id bigint,
    phone_number varchar(20) NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    PRIMARY KEY (id)
)
WITH (autovacuum_vacuum_scale_factor='0.0', autovacuum_vacuum_threshold='5000', autovacuum_analyze_scale_factor='0.0', autovacuum_analyze_threshold='5000');

ALTER TABLE leads ADD CONSTRAINT fk_campaign_id FOREIGN KEY (campaign_id) REFERENCES campaigns(id);
ALTER TABLE leads ADD CONSTRAINT u_telco_lead_id UNIQUE (telco_lead_id);
