uniform float uTime;

varying vec3 vPosition;
varying vec2 vUv;

float PI=3.1415926535897932384626433832795;

float hash(vec2 p){return fract(1e4*sin(17.*p.x+p.y*.1)*(.1+abs(sin(p.y*13.+p.x))));}

void main()
{
    float angle=(atan(vPosition.y,vPosition.x)+PI)/(2.*PI);
    
    vec2 nUv=6.*vec2(8.*angle,vUv.y*5.);
    vec2 gUv=fract(nUv)-.5;
    gl_FragColor=vec4(vUv,1.,1.);
}