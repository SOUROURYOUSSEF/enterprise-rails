    $(document).ready(function() {
        $('#users_table').DataTable({
            "ajax": "users.json",
            "columns": [
                { "data": "first_name" },
                { "data": "last_name" },
                { "data": "username" },
                { "data": "email" },
                { "data": "groups" },
                { "data": "scope" },
                { "data": "actions" }
            ],
            "paging": true,
            "bServerSide": true,
            "sServerMethod": "GET",
            "lengthChange": false,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "iDisplayLength": 10
        });
    });
