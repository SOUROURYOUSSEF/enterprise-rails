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

function historySupport() {
    return !!(window.history && window.history.pushState !== undefined);
}

function pushPageState(state, title, href) {
    if (historySupport()) {
        history.pushState(state, title, href);
    }
}

function replacePageState(state, title, href) {
    if (state == undefined) { state = null; }

    if (historySupport()) {
        history.replaceState(state, title, href);
    }
}

$(function() {
    window.onpopstate = function(e) {
        if ($('body').attr('data-state-href') === location.href) {
            return false;
        }

        if (e.state !== null) {
            // do something with your state object
        }

        $.ajax({
            url: location.href,
            dataType: 'script',
            success: function(data, status, xhr) {
                $('body').trigger('ajax:success');
            },
            error: function(xhr, status, error) {
                // You may want to do something else depending on the stored state
                alert('Failed to load ' + location.href);
            },
            complete: function(xhr, status) {
                $('body').attr('data-state-href', location.href);
            }
        });
    };


    /*var getA = 'a[data-remote][data-method!="put"][data-method!="post"][data-method!="delete"]'
        , getForm = 'form[data-remote][method="get"]'; */

    var getA = 'body a.push_state';
    /* var getForm = 'body form[data-remote][method="post"]'; */

    function getState(el) {
        // insert your own code here to extract a relevant state object from an <a> or <form> tag
        // for example, if you rely on any other custom "data-" attributes to determine the link behaviour
        return {};
    };

    $('body').attr('data-state-href', location.href);

    /* use .on to bind event to all current and future remote links */
    $(document).on('ajax:beforeSend', getA, function(xhr) {
        pushPageState(getState(this), "Loading...", this.href);
        window.title = "Loading...";
    });
    /*
    $(document).on('ajax:beforeSend', getForm, function(xhr) {
        pushPageState(getState(this), "Loading...", this.action);
        window.title = "Loading...";
    });
    */

    /*
    $(getA).on('ajax:beforeSend', function(xhr) {
            pushPageState(getState(this), "Loading...", this.href);
            window.title = "Loading...";
        });

    $(getForm).on('ajax:beforeSend', function(xhr) {
            var href = $(this).attr("action") + "?" + $(this).serialize();

            pushPageState(getState(this), 'Loading...', href);
            window.title = "Loading...";
        });
     */

    $(document).on('ajax:complete', getA, function(xhr) {
        $('body').attr('data-state-href', location.href);
        replacePageState(getState(this), window.title, location.href);
    });

    /*
    $(document).on('ajax:success', getForm, function(xhr) {
        $('body').attr('data-state-href', location.href);
        replacePageState(getState(this), window.title, location.href);
    });
    */


    /*
    $(getA + ',' + getForm).on('ajax:complete', function(xhr) {
            $('body').attr('data-state-href', location.href);
            replacePageState(getState(this), window.title, location.href);
        });
    */

});
