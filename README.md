Questions?

sub query:
select * from workout where updated_at in (select max(updated_at) from workout);