function ScreenShake(_magnitude, _length) {
    if (_magnitude > global.iCamera.shakeRemain) {
        global.iCamera.shakeMagnitude = _magnitude;
        global.iCamera.shakeRemain = _magnitude;
        global.iCamera.shakeLength = _length;
    }
}