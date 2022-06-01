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
    
    vec2 id=mod(floor(nUv),vec2(6.));
    float n=hash(id);
    gUv.x*=2.*step(.5,n)-1.;
    
    float d=abs(abs(gUv.x+gUv.y)-.5);
    
    float mask=smoothstep(-.01,.01,d-.3);
    
    if(mask<.0001)discard;
    
    gl_FragColor=vec4(vec3(mask),mask);
    
    if(!gl_FrontFacing){
        gl_FragColor.a*=.5;
    };
}