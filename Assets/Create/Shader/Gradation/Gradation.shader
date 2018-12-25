Shader "Custom/Gradation" {
	Properties {
		_Color ("Color", Color) = (1,1,1,1)
		_Displacement("Value" , Range(0,10)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Transparent" }
		Cull Off ZWrite On Blend SrcAlpha OneMinusSrcAlpha

		Pass{
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag
			#include "UnityCG.cginc"

			struct v2f
			{
				float4 pos : SV_POSITION;
				float3 worldpos : TEXCOORD0;
			};

			float4 _Color;
			float _Displacement;

			v2f vert(appdata_base v)
			{
				//処理している頂点のワールド座標を計算
				v2f o;
				float3 n = UnityObjectToWorldNormal(v.normal);
				//o.pos = UnityObjectToClipPos(v.vertex);
				o.pos = UnityObjectToClipPos(v.vertex) + float4(n * _Displacement , 0);
				o.worldpos = mul(unity_ObjectToWorld , v.vertex).xyz;

				return o;
			}

			half4 frag(v2f i) : COLOR
			{
				//ワールド座標のy成分に基づいて頂点の色を決定
				float4 red = float4(255.0/255 , 70.0/255 ,150.0 / 255 , 1 );
				float4 blue = float4(90.0/255 , 90.0/255 ,250.0 / 255 , 1 );
				return lerp(red , blue , i.worldpos.y * 0.2);
			}
			ENDCG
		}
	}
	FallBack Off
}
