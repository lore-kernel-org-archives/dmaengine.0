Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76F6400962
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 11:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756442; cv=none; b=GJj+nF1txmof5vx5bd3ccEXrHXmR79GIKx6HcQLbETvhmVbfxDYc6gKey8IXOr9xVMcMYIt/MfXbyY9W7By99qLdSjoKSK389Xks54npOrkTOCUAYI1FB537z2P8ckQhD4g0UuRZHG+OaSoa4YHXVPYWBplfb7Orw7G+xmhaP8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756442; c=relaxed/simple;
	bh=ZSLNLHFO7Jhg77ucFKiasYsGyDaqzctpLXxptFW2ECA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzrmOa72yuy5kO9toCIk8f4r7sX5tHyqjD9f4clY8somxKGWmgtFDTy1IUC5/xAjgob2aBsK4XV/wmrwSBQArzY2LSYbYrpeDXpVxqWn2XvcPjNTXtsjyuGMnRamUVYh6QQCWJRu2R2WeoIyQifTjUXYGCSEW6e+SQaWVHppNP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hYUbSCW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GgChUbAk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hYUbSCW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GgChUbAk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AFAnd4014103
	for <dmaengine@vger.kernel.org>; Mon, 3 Aug 2026 11:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrSMogFbEylz8K281GGh7nRyEeaTHtLfSb1WcVkfZKs=; b=hYUbSCW6qnq/oAq0
	Ltg9X5V/LE2ECywfKd6rwTaE+E3RhVF49hyH51Montt9NMQiof6PJgPfZWy5VKCk
	1eSgq8IZJcV1n5F+2B4LyA1BKm2cLlIy+QueVckNNRo1aLt63QU7NkYBR0mHTbJO
	TKncKxcfcacSbUDEqjpTJkvE8cjTfdAxveU5PHX/XmJvBRfeKCcsAfr+xVIMyMrh
	rBkaS3o/s44/8bkRhN6V1SUnXTTlSOZLsAv2oCfKQzeWGZIG81ew8RuMKQGqq9Z+
	4bXLEH3BS9s88mnTYIuL34gtj5BIz0uf5wCQwZ9yGelzJDwvfn2eiX0UVTrjW2Cx
	spFGfA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt991u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 11:27:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cab041eced3so5241342a12.1
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 04:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756439; x=1786361239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrSMogFbEylz8K281GGh7nRyEeaTHtLfSb1WcVkfZKs=;
        b=GgChUbAkSpSDm9iIxxQsNOwIpiCL7DuadoovLol8MUWGQfnNEr/Iwt5HqzifD4YNuF
         ElrPsEn4Zoj1tQXcMasPDa20N/ulMgtAmuHTUrfJaXovYm7qhejvnECZeSirVkxBgVwE
         dRs4M8Ubd/QObJ3z/HVFGZCCHx5iRV0QOdGbuZ9RKNx2JgajYVIcDCwyhuIMoO8Fti/t
         5/paFtFfzSG+/I5LbdvEhlnyksLnnBw924O1fB+XOEjyXabW6ab+RlNfZj7/SFjTnSNf
         57jI7ftTc9UxT9JkOCSbXsmI5fX/6fTKQjg4igxO7LMc1NUx/zmQ2nKgLzt+YO53K/Q8
         4u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756439; x=1786361239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrSMogFbEylz8K281GGh7nRyEeaTHtLfSb1WcVkfZKs=;
        b=auqE0N2PV1EKsAzY9wq7QEWUgXqoQfpj5kWclJ65wU0AHaoBmia9FuqYtVugqKwocS
         HB77GguwWqDuPF5TvLI8biAqR/b/aCxAaymqCTMFYejN+BONgiTuOmWRz0oLA/XbHAuM
         T3ZHjhgpC+w8xZUmwJDDCS0+5avgOwflE9iSXwH1RyfED+qfbdrd6uULM3H46aE9p7O0
         OKds6ay+IkWebiS8GMw2yYjsRh7og7F7dOtUWGGRALoo3e24RlPArmjwVQqbv5FMOomE
         28jAPXPfns1imvj0Q1rXFPC9sg1b95K+J1P3yriMilscZerRg2RmrlbixyOwUZFAXA5I
         kk5g==
X-Forwarded-Encrypted: i=1; AHgh+RobQ5HrZkcZuKdFeLBaVdUaWmZjA41vcwt/XOkrqO1uqV3Z1yZTyPw5HYyxrMNoNuy4h+PRrYJi00c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIeCyFPlp5UcAAMKVTHAqQjy+qBfK8OOc+rweKv+o7RwKMjzvv
	DD56SXEofMW3i1v7kGTjeTMjxMaIvO2DU+RTPDXVLg8iS0rlEAtMlUE5b11vVYqPJFxVwu9+6B4
	nUKrgqjHNc/VYOlZvBM6U+81lW1DYTUN2/oF9ABsqgE6m8Sq1dkXRCYrgUNhtBbs=
X-Gm-Gg: AR+sD11PT+3tudNwrplYt6aw5MZ3vj+q7OG8aqe9K6pbRE1L8+IfmBOVGbeph1EirwW
	27ttHXyQnshLs0ZF+LLO6yBfn2XiWFDUiI4UWzAIh3gQiB2IycTy5j0QHnnPUwkuAUJrVF0Ds6P
	WYqh4PBf3i+osRReCzBMI9xGshKJm0VGIDYR4I1FlY1Wr7dx9RuVIz+rMTauaTtth6rjDJTG7SS
	qL3ovDpJB4nWbJuOSmTaTlzLuYrIx74qZzsU21m1DuWFM8jNCV7PHVAUWM6UEKlU9Oxp5yqoEAM
	xOCefi1l70pO5zkSc3wgg7pFWaPZBRX7sgr0ogrOO6X1uHNpsYEgU4w6bXTyMu4vMawkEDWcqxW
	To0+gFbokkS3auYw=
X-Received: by 2002:a05:6a21:9217:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3c92a598c8fmr9578413637.31.1785756437931;
        Mon, 03 Aug 2026 04:27:17 -0700 (PDT)
X-Received: by 2002:a05:6a21:9217:b0:3c3:9df8:2eed with SMTP id adf61e73a8af0-3c92a598c8fmr9578371637.31.1785756437457;
        Mon, 03 Aug 2026 04:27:17 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:16 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:34 +0530
Subject: [PATCH RESEND v7 05/10] arm64: dts: qcom: shikra: Add CDSP,
 LPAICP, MPSS remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-5-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=5353;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=GX7eUKJhnz0wY/ytBwmoxXx40TMd3vY5u1r6Yi60BFM=;
 b=nH3UW47oO2r1Yz1r9KHbVd6quyq+g0waHCXC0/kQch9wyxsU2DMm4A9PhDb2Qm63VPkvxH0vh
 GzgfE5qo8kSDyspWyb/rAzClTxd9GErW04JBHubd5UXvG42GNl7wLqG
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfXz0BrCwEuyFTU
 bShNnME4mpeq7lHsABw41N5xcU3hpSaDCRcMzbONDOkaRLdX/4VxupcDj926B47C+XdB350NEHO
 AQYxOeepR0StMBJYjc8N7Ff41TXELkGDOH5sEWLmWnQ5y3ju7yQEk+zedNV20jekAA48dYnj+Kb
 +mk2omo5S8dnF58yN2GXwdpdJJBi1syCupI1hiQK4jYD3FZitWrTgucvWVyfxwb/g93t8wxVVsS
 /JqtnK9L40wj1YseVT62V1yv7ZtydiZjRZumHvCSxbrwgobgvZDNy2lvzwLl2sQf2HVzZbqhvGP
 kdqsbidk6HCwvRu2cEJbpiJK2KpeRsn4yiYZWw9Fb9uEu6SOyG/QLSWncR5c6z9BvuMHJqPbG+O
 TX4ysa7qeE2y0HOqBeYzFNt0IFpaSogJVr0JNY+DX0yNqFZ8AC2ZFZXMlGzKbHbsuPd1s5ugw/y
 50F8mRMx79IIk3KSe7w==
X-Proofpoint-GUID: hO8cbzsr0sVTSo_DpM9iHg4X8PstlcXP
X-Proofpoint-ORIG-GUID: hO8cbzsr0sVTSo_DpM9iHg4X8PstlcXP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX1EKoON3CW3l9
 K+skXB0c5b1ovu6TwcpPtvdVXPkEoyPNxRs0qEjgC8MfScbIQRNmKvsBkV5ZxYnUyuwIYs7IDqb
 vt2zc+xs6LJCRmRSlCAAMAvn817IOr0=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a707b17 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030102

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 42a17ffc040f..570505c927bb 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1813,6 +1813,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,shikra-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&mpss_wlan_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 12>;
+				qcom,remote-pid = <1>;
+				label = "mpss";
+			};
+		};
+
+		remoteproc_cdsp: remoteproc@b300000 {
+			compatible = "qcom,shikra-cdsp-pas";
+			reg = <0x0 0x0b300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 4>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					label = "cdsp";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0201 0x0000>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0202 0x0000>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0203 0x0000>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0204 0x0000>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0205 0x0000>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0206 0x0000>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x0209 0x0000>;
+					};
+				};
+			};
+		};
+
+		remoteproc_lpaicp: remoteproc@b800000 {
+			compatible = "qcom,shikra-lpaicp-pas";
+			reg = <0x0 0x0b800000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
+					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
+
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
+
+			qcom,smem-states = <&lmcu_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <26>;
+				label = "lpaicp";
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

