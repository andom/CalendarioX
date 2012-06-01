function QueryString(ID) {
    var URL = document.location.href;
    if (URL.indexOf('?' + ID + '=') > -1 || URL.indexOf('&' + ID + '=') > -1) {
        var qString = URL.split('?');
        var keyVal = qString[1].split('&');
        for (var i = 0; i < keyVal.length; i++) {
            if (keyVal[i].indexOf(ID + '=') == 0) {
                var val = keyVal[i].split('=');
                return val[1];
            }
        }
        return "";
    }
    else {
        return "";
    }
}