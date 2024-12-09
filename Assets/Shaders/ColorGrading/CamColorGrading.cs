using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamColorGrading : MonoBehaviour
{
    [SerializeField] private Material colorGradingMaterial;

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, colorGradingMaterial);
    }
}
