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
				return ((p.x*p.x+p.y*p.y)-10);
			}



			fixed4 frag (v2f_img i) : SV_Target{

				float2 p = (i.uv)-float2(0.5f,0.5f);

			
				return float4(Circle(p),0,0,1);
			}
			ENDCG
		}
	}
}