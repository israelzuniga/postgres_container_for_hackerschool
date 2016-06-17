
#!/bin/bash

pg_restore -U postgres -d dvdrental dvdrental.tar

echo ""
echo "******DATABASE RESTORED******"
