var restartfunction = false;

$(function() {
    $("body").hide()

    window.addEventListener('message', function(event) {
        var edata = event.data;
        if (edata.type === "show") {
            if (edata.status == true) {
                restartfunction = false;
                $("body").fadeIn();
                $("body").show();
            } else {
                restartfunction = true;
                $("body").hide();
            }

        }
    })

    window.addEventListener('message', function(event) {
        try {
            switch (event.data.action) {
                case 'hidebutton':
                    $(".hastahanego").FadeOut(200)
                    break;

                case 'showbutton':
                    $(".hastahanego").show()
                    break;

                case 'starttimer':
                    if (event.data.value != null) fiveMinutes = 60 * event.data.value,
                        display = $('.time');
                    startTimer(fiveMinutes, display);
                    break;


            }
        } catch (err) {}
    });

    $(".hastahanego").click(function() {
        $.post('https://lod-death/bildirim', JSON.stringify({}));
        return
    })


})

function startTimer(duration, display) {
    var timer = duration,
        minutes, seconds;
    setInterval(function() {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.text(minutes + ":" + seconds);

        if (--timer < 0) {
            timer = duration;
        }

        if (restartfunction == true) {
            timer = duration;
        }

    }, 1000);
}

$(".hastahanego").click(function(e) {
    $(".hastahanego").fadeOut(200);

});