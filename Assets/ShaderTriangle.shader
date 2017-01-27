
//this script is learnd by http://glslsandbox.com/e#38101.0

Shader "Template"{
	SubShader{

		Tags { "RenderType"="Opaque" }
		LOD 100

		Pass{
			CGPROGRAM
			#pragma vertex vert_img
			#pragma fragment frag

			#include "UnityCG.cginc"


			const float PI = 3.14159265;

			float Circle(float2 p){
				p*= 10.0;
				return ((p.x*p.y+p.x*p.y)-10);
			}

		

			fixed4 frag (v2f_img i) : SV_Target{

		float2 p = i.uv-float2(0.5,0.5);
	float3 color1 = float3(2.0,2.0,2.0);
	
	p.x+=0.1*cos(_Time);



	float3 pos =  float3 (p.x, 0.5, abs(p.y))*2.0;
	//float2 sur =  float2 (pos.x/pos.z, pos.y/pos.z)/3.0;

	float2 sur =  float2 (pos.x/pos.z, pos.y/pos.z)/3.0;

	sur.y += _Time/2.0+sin(_Time/4.0);
	float f = (sign((fmod(sur.x,0.5)-0.1) * (fmod(sur.y,0.3)-0.1)));
	f*= pos.z*pos.z*5.0;

	//p*= rot(11.0 + 0.1*sin(_Time));

	float3 pos1 =  float3 (p.x, 0.5, abs(p.y))*2.0;
	float2 sur1 =  float2 (pos1.x/pos1.z, pos1.y/pos1.z)/3.0;
	sur1.y += _Time/2.0+sin(_Time/4.0);	
	float sf = (sign((fmod(sur1.x,0.5)-0.1) * (fmod(sur1.y,0.3)-0.1)));
	sf*= pos1.z*pos1.z*2.0;
	
	//float l  =    0.1+0.05*abs(clamp(sin(_Time/4.0),0.1,0.5))/length(p-float2(0.07*sin(_Time),0.007*sin(_Time/2.2)));
			float l  =    0.1+0.05*abs(clamp(sin(_Time/4.0),0.1,0.5));

	//float l1 =l + 0.1+0.01*abs(clamp(sin(_Time/4.0),0.1,0.5))/length(p-float2(.07*sin(_Time/1.2),0.07*sin(_Time/2.1)));
			float l1 =l + 0.1+0.01*abs(clamp(sin(_Time/4.0),0.1,0.5));

	f+=l+l1;
	
	color1.b=  sf*f;
	color1.g=  f+sf;
	color1.b+=-f+sf;
	
	
	return float4(lerp(color1,float3(0.1*f,0.15*f,.25*f*sf),0.75),1.0);
			
		}
		ENDCG
	}
}
}