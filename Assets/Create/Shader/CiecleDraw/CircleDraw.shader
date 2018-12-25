Shader "Custom/CircleDraw" {
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200

		CGPROGRAM
		#pragma surface surf Standard
#pragma target 3.0

		sampler2D _MainTex;

		struct Input {
			float3 worldPos;
		};

		void surf (Input IN, inout SurfaceOutputStandard o) {
			float dist = distance(fixed3(0, 0, 0), IN.worldPos);
			float radius = 2;
			//リングを一つ書く
			//ワールド座標が変数radius以内なら白、radiusより大きいなら紫色にする
			/*if (radius < dist &&radius + 0.2 > dist)
			{
				o.Albedo = fixed4(1, 1, 1, 1);
				
			}
			else
			{
				o.Albedo = fixed4(110 / 255.0, 87 / 255.0, 139 / 255.0, 1);
			}
			*/

			//リングをいっぱい書く
			float val = abs(sin(dist*3.0 + _Time*100));
			//Sinの波が上限に近いときに白で描画
			if (val > 0.98)
			{
				o.Albedo = fixed4(1, 1, 1, 1);
			}
			else 
			{
				o.Albedo = fixed4(110 / 255.0, 87 / 255.0, 139 / 255.0, 1);
			}
		}
		ENDCG
	}
	FallBack "Diffuse"
}
