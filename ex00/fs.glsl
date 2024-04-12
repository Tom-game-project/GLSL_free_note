precision mediump float;
uniform float time;
uniform vec2  mouse;
uniform vec2 u_resolution;


void main(void){
    vec2 p = (gl_FragCoord.xy * 2.0 - u_resolution) / min(u_resolution.x, u_resolution.y);
    vec2 color = (vec2(1.0) + p.xy) * 0.5;

    gl_FragColor = vec4(p.y,color, 1.0);
}