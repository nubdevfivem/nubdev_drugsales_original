delay = 500
fadetime = 500
timeout = 0
result = ""

window.addEventListener("message", function(event) {
    item = event.data
    if (item != null) {
        if (item.ui == true) {
            reset()
            timeout = 0
            timeout = item.timeout;
            $('#time').html(`เหลือเวลาอีก ${timeout} วินาที`)
            start();
            $('body').fadeIn()
        }
    }
})

var clicked = false;
suit = ["แพ้", "แพ้", "ชนะ", "ชนะ"];

function shuffle(o) {
    for (var j, x, i = o.length; i; j = parseInt(Math.random() * i), x = o[--i], o[i] = o[j], o[j] = x);
    return o;
};

function getSuit() {
    var x = parseInt(Math.random() * suit.length);
    return suit[x];
}

function getCards() {
    for (var i = 0; i <= suit.length; i++) {
        var str = ".card" + i;
        var str2 = " .front";
        var el = str.concat(str2);
        var output = getSuit();
        $(el).text(output);
    }
}

function play(name, type) {
    var audio = new Audio(`./${name}.${type}`);
    audio.volume = 0.2
    audio.play()
        // audio.stop
}

function start() {
    $('.card').hide();
    getCards();
    setTimeout(() => {
        play('cardSlide2', 'wav')
    }, delay * 0.7);
    $('.card1').delay(delay * 0.5).fadeIn(fadetime);
    setTimeout(() => {
        play('cardSlide2', 'wav')
    }, delay * 1.7);
    $('.card2').delay(delay * 1.5).fadeIn(fadetime);
    setTimeout(() => {
        play('cardSlide2', 'wav')
    }, delay * 2.7);
    $('.card3').delay(delay * 2.5).fadeIn(fadetime);
    $('.title').delay(delay * 3.5).fadeIn(fadetime);
    $('#time').delay(delay * 3.5).fadeIn(fadetime);
    $('.btn-random').delay(delay * 3.5).fadeIn(fadetime);

    setTimeout(() => {
        clicked = true
        Interval = setInterval(function() {
            // console.log(timeout);
            if (timeout > 0 && clicked) {
                timeout--
                $('#time').html(`เหลือเวลาอีก ${timeout} วินาที`)
            } else {
                clearInterval(Interval)
                if (timeout < 1) {
                    $('#time').html('หมดเวลา')
                    setTimeout(() => {
                        $("body").fadeOut()
                        $.ajax("http://nubdev_minigamecard/timeout", {})
                    }, 700);
                } else {
                    if (result == "แพ้") {
                        play('error', 'mp3')
                    } else {
                        play('success', 'mp3')
                    }

                    setTimeout(() => {
                        $("body").fadeOut()
                        $.post("http://nubdev_minigamecard/success", JSON.stringify({
                            result: result == "แพ้" ? "loss" : "win"
                        }))
                    }, 1700);
                }

            }
        }, 1000)
    }, delay * 3.6);

}

function reset() {
    result = ""
    $('.title').hide();
    $('.btn-random').hide();
    $('#time').hide();
    $('.card1').addClass('flip').removeClass('zoom')
    $('.card2').addClass('flip').removeClass('zoom')
    $('.card3').addClass('flip').removeClass('zoom')
}

$('#progress-time').css("width", "100%")

$('.card').click(function() {
    if (clicked) {
        clicked = false
        result = $(this).children('.front').delay(1000).text()
        $(this).addClass('zoom')
        setTimeout(() => {
            $(this).toggleClass('flip')
        }, 300);
    }
});

$('.btn-random').click(function() {
    if (clicked) {
        var r = Math.floor((Math.random() * 3) + 1)
        $('.card' + r).click();
    }
})