precision mediump float;
uniform float time;
uniform vec2  mouse;
uniform vec2 u_resolution;

vec2 f(vec2 a,vec2 c){
    vec2 rvec;
    rvec.x = pow(a.x,2.0) - pow(a.y,2.0) + c.x;
    rvec.y = 2.0 * a.x * a.y + c.y;
    return rvec;
}

float pixel_check(vec2 c){
    vec2 z;
    for (int i = 0;i < 100;i++){
        z = f(z,c);
        float len = length(z);
        if (len >= 2.0){
            return float(i);
        }
    }
    return 100.0;
}

void main(void){
    //正規化
    vec2 p = (gl_FragCoord.xy * 2.0 - u_resolution) / min(u_resolution.x, u_resolution.y);
    float i = pixel_check(p/0.5);
    gl_FragColor = vec4(vec3(i/100.0),1.0);
}
