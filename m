Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757173C4B71
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 07:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225233; cv=none; b=Aj09Ylcy6D32XmbtlbU23hevbGTkSXD4/LXT7fMv3qfYinfax4dvcsx3ZJ8+q3JDlthfgFzGZRsncCJYgwXmIwTxNVdUfl791RPBZYYtEcKSOTEyInlN/lWA1v5cS+TFW1Y3xxoHALeFUI7H8UCOkEEUzlcTvP9N6SN7A9Qs1pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225233; c=relaxed/simple;
	bh=OtD1wBdBAGt5o8LyIVEQ/StYqmup1okLzQrHXXtukSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeUXWGUXOgMXdliba6rmFlUilSnprm7zJT1xxt6/XxiI2UZt//VyTO3K9GqPgJntFbqeIhUtCD+1VZdfIJi4qGmFt0gf6AUuLI8RUdmgX5XH4b+lU8mZ4pdITmQCu1N8JPCYT4zExTDk84G5O8AxmkL2wc/ioFrK3PaJzHFSQWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmMxxwtm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VFkyET+U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmMxxwtm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VFkyET+U"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S40eiU1593338
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 07:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=; b=AmMxxwtmquKYOJMP
	dbiEZwDECfBxqWfjFzvvuvQzFFs+YqaEtjFIgF2Q5jYoo1fp6U8FYA3PqlJb0qmf
	kNJdYUSI5QuupRx9DVhIoWhg5s0Wa38SerzSnFPTQ/mDDLmk+rM+voaoV7qpM/xq
	1CU8mRJven8a24Weot7TO3Kg4POMNWNgk4O4/aY1P7mIMnblGsDn+ZZ2FaLkKxbT
	9mw5gl3oqJAYzzepQWxXciXHNzu9CVJFKsoj5BKFbAvnC/gOHSE6yrozh4ELobn3
	O9hmrxe7z4PszBazKInYlYEUclJ/huBUW9xS0xPp0Pj9ApLZSPvxkp4Ma0gsV1Xj
	LRap2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn19gu9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 07:53:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e25e4b41cso4276748a91.0
        for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 00:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785225230; x=1785830030; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=;
        b=VFkyET+UNQ3U5yk7bPV6m1T206tz8raNoM6K/Cvtgg584TA01dPhJWG0KCIblaGyMW
         ipQBvGng9Ze41mKAIC3z4TozJsYMGqyhcyHobCjiv308M/JJSRWM8B1QR+V3ieU/PeqA
         So+ybGaeLQk+Ld5+Dg2dzt87MWXmW1MeWVUVrqB5ZRiFeJPjO7nQ5egd2sGdgnlR7uG0
         6SOMaynF5zFfzHRzKQinU09z+aRY7zWCEMHENdxp3aRu/fEYCg5JsxDWHFqWprhj5A6R
         C7TD1ydr1A+BWYNWPnnuM4XLeRsMHEwaEdHs3ud8DPXm3cEkQGwjRPJn5Wx7x3YHF7jF
         wfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785225230; x=1785830030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utuyuAxHY1PaIfD6AjLDIYVdeOwFDZ64oCdWRPB/Vnw=;
        b=SrnK5kFwxxuLlMalX2l0zpgreH/HiBNne0Lar/X3ZlFh+smgtleCP+q3YpRRemI5e3
         Pg2/G4UaxHhfIDAmCUMDcGsI0lf/oV3/R6gi/Y00QaVbeon1FiFmy9dJMRCEQVst0j0L
         NQuvIrabOBJcGdTDVrvKdVlb5sEgX2TnKSmf9Dzp7E5RO3XNnwxIEgLsmi/cTU6sqPtJ
         tj+0TYY6VyGxb/HOhpygouIrjOytv7wk4Pgsjs9cy7/4eK6eWP6MJVsMO9ipclXTKLkd
         irGx/yR6HK0OrLlKl3xGkAc5McUjspUesgMaf5HoHmXKfMtE/MhDY5JESi9wqsaOZL2k
         ksig==
X-Forwarded-Encrypted: i=1; AHgh+RpHCXzTSTs7jLAyo8/obbs8LVcaW4uUa5pQWu23NvfdDqY/+fSKjf9u/Rbb4Ry/HYuaC48JdeZE+PE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKsR1fx3yku/MKKEnlr93nOUDB8gHmN0GK7d8oAfSikS9zOF5
	aQsD7ex4lg7KIoGn1WfXCZVoHSLljNcO9hY0S6rEVPwYqV2rVFtGSUMd6pQqZSOCd1eKrSBhZbZ
	TDpKPu0mR1l3u5WjhpLWskNSM9NZAi0edp1fEIamZCySX7fYsx2jq/G26vOQWFz0=
X-Gm-Gg: AR+sD10nYHT99jBzaT2GR4xFFVfWbDgwZb5AlslUjUHeHbxh6ZmrKqI3AXmD4jqZeoA
	3onRBdvo1lw0uSgT3chmXm+fibzv2JYckVHkvrY78Fj/tqMF61m50SncTMKBbUi96v5Eq0ntIOf
	sA48ldXrpO/37EMigbXWZlMA8V+73PUGRIA/9RvXChVChBFJuOPgxkbXhTVQ+WgMwBz1HVexQoO
	u0BWL65CxwwUJ/nLfGu70An6Iob+GoU+ITxO33AlY2vizSHhSrfIfO94FWuB6lpplOXaFldYwlX
	+8t2PodcDt2sdZKUsVRG/tSJp57aYrvEMoYukpDjTNmlC0NYQWmCPifsk4RJt+MCtsu/K+tnRj5
	tf7UWBnCDe0vNExQDxVIsYps1nLCwTbZwaecRZCt+NiNjZA5wEnU8NVG9Z+ZKbiNXuWtLcg==
X-Received: by 2002:a17:90b:4a0f:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f6a310c5emr1802044a91.7.1785225230275;
        Tue, 28 Jul 2026 00:53:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4a0f:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38f6a310c5emr1802005a91.7.1785225229738;
        Tue, 28 Jul 2026 00:53:49 -0700 (PDT)
Received: from [10.133.33.15] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f090619f4sm3509401a91.3.2026.07.28.00.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 00:53:49 -0700 (PDT)
Message-ID: <51bf3573-adcf-41fc-905d-471dfce8111f@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 15:53:45 +0800
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Maili
To: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260708-maili_upstream_gpi_binding-v1-1-e48cb7e216e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TJV1jVla c=1 sm=1 tr=0 ts=6a68600f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sNGwWByCUGpZoCTVRkwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX7ukx4eNZ+Uep
 yGc/QsDHt8BPKShOiQuFZ0akmQS5NdC8JOs9zqHF/dFcBLcMO0o9P0jgbKgqWrb+FS+aUpiaEfu
 ICC5QknAqMM9P5yPFOdWsZvVBMmaV2BMXxfK6FxjAdUHOf5V+7F2AQUFI2UhXnWiSa6bU3lhZKI
 gJveeeDEXe6WVaa/2hUXja27fivwoaNvldNEZPua1AxeENfl+PUSP14i3nPe6cYndOF3po2EXAD
 4AJWr6xtXOJqvHCV2a+2ueJllQr61Geu11HizRbWaCY1D7elDonF9/2EUjl/LEGDLtDTDFMiENI
 w8DAJUfJIqFiaTxXVFvH9RDxXe69WcAF3FgFZ1Mx07bN6NzigPGN0UzWhljUPOqPnpRIvkUN2ln
 cabGbzsYS0UBCotg3zh9TEegOBZQz7s0eI687BIWzRaaYTuj0pvxuVQqgHKYGVWsB7Kpo/m527d
 Mpib+C9oCKpaNoKLVkQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2NiBTYWx0ZWRfX30YgFsobQAq3
 V8L4JZQqWobqTHTQrDcdw/F7ZKY2YCl5I8/q7T5FKQXKurPbmiKHvZ64AY0E9omCTuR7yHuRLyO
 4Zd4+9pKPUtKZuAHUybEoeq2hLVLnPg=
X-Proofpoint-GUID: erPxPKyeExc7NME_gmsspK3q15Xq6ovc
X-Proofpoint-ORIG-GUID: erPxPKyeExc7NME_gmsspK3q15Xq6ovc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1011
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280066

Hi Vinod,

Gentle remind the pick up the patch.
just checked that it can apply cleanly on the latest linux-next tag.

Thanks,
Jingyi

On 7/8/2026 3:05 PM, Jyothi Kumar Seerapu wrote:
> Document the GPI DMA engine on the Maili platform.
> 
> Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> index 54dca623223d..dfc4a3054b5d 100644
> --- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> +++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - qcom,glymur-gpi-dma
>                 - qcom,hawi-gpi-dma
>                 - qcom,kaanapali-gpi-dma
> +              - qcom,maili-gpi-dma
>                 - qcom,milos-gpi-dma
>                 - qcom,qcm2290-gpi-dma
>                 - qcom,qcs8300-gpi-dma
> 
> ---
> base-commit: 598c7067dd8b65b93f3ccada47e9014a13137f1b
> change-id: 20260708-maili_upstream_gpi_binding-da1d2af41b78
> 
> Best regards,
> --
> Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
> 
> 

