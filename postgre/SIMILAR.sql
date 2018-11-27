SELECT distinct event_key FROM public.metrics_alert_metadata
where day = '20181126'
and lower(event_key) SIMILAR TO '%'||lower('QQ')||'%'
and platform = 'app'
and os = 'android'
