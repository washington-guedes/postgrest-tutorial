-- language plpgsql

create or replace function auth.check_token() returns void
  language plpgsql
  as $$
begin
  if current_setting('request.jwt.claim.email', true) = 'disgruntled@mycompany.com' then
    raise insufficient_privilege using hint = 'Nope, we are on to you';
  end if;
end
$$;
