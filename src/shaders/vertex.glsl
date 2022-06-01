varying vec2 vUv;

void main()
{
    // vec4 mvPosition=modelViewMatrix*vec4(position,1.);
    // gl_PointSize=100.*(1./-mvPosition.z);
    vUv=uv;
    
    vec3 newPos=position;
    
    newPos+=.27*normal*(4.*vUv.x-.03);
    
    gl_Position=projectionMatrix*modelViewMatrix*vec4(newPos,1.);
    
}