Shader "Custom/WaveShader"
{
    Properties
    {
        _MainColor ("Albedo", Color) = (1, 1, 1, 1)
        _EmissionColor ("Emission", Color) = (1, 1, 1, 1)
        _Freq("Frequency", Range (0,5)) = 3
        _Speed("Speed", Range(0, 100)) = 10
        _Amp("Amplitude", Range(0,1)) = 0.5
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert vertex:vert
        #pragma target 3.0

        struct Input
        {
            float3 vertColor;
        };
        
        float _Freq;
        float _Speed;
        float _Amp;

        struct appdata
        {
            float4 vertex: POSITION;
            float3 normal: NORMAL;
            float4 tangent : TANGENT;
            float4 texcoord: TEXCOORD0;
            float4 texcoord1: TEXCOORD1;
            float4 texcoord2: TEXCOORD2;
        };

        void vert(inout appdata v, out Input o)
        {
                UNITY_INITIALIZE_OUTPUT(Input, o);
            float t = _Time.y * _Speed;
            float waveHeight = sin(t + v.vertex.x * _Freq) * _Amp + sin(t * 2 + v.vertex.x * _Freq * 2) * _Amp;

            v.vertex.y = v.vertex.y + waveHeight;
            v.normal = normalize(float3(v.normal.x + waveHeight, v.normal.y, v.normal.z));
            o.vertColor = waveHeight + 2;
        }

        float4 _MainColor;
        float4 _EmissionColor;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = (_MainColor * IN.vertColor).rgb;
            o.Emission = _EmissionColor.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}