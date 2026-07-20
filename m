Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5219DF4F
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544661; cv=none; b=MR35pIGudwMm77XExuNYcPt0HEuntVb/SxJQqO//eJ5EeITauIuHE2sI/AOR1LDrBN9bOcO3p9jPQsV6yR12maPBY/4wkT2pmEfLByH+TkQ6mb1I8vJBFV9nQTjUFxVYa+mxyILSeeYdHWute+yGTbaD9gYClhDZ5l0WeILMnNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544661; c=relaxed/simple;
	bh=gGOcOClOufbjsAy34iXb++FNQ29HyxuzrB0+WRNoYEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d1uyph5k1wqPqmTcFjmSjAfso/Q9phuuSuF4Xp433vwZXQ29rihaUEnLr5xMW8vAcNd+T4OMPlqhyimlkOUKfySBZlYwU7JvOfZBZ+vieVQc+8KyxGQVleFzONh9umZX8yvevCz6VRD0Onl256pfetOlKB03/tRLTfGKQWsVTDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=baGlWFNc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XKG0k601; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="baGlWFNc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XKG0k601"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vrGa2189018
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjX3LlHlsVHojRvPM71du9cKmTiXYa777UZyKZrMZ7g=; b=baGlWFNcGEPv7NIt
	iQf0KRci7XFae2TsOuEH+0Kxg0MWOiv1jLTzJt057wckBDeaZQc3Mvx5eP6z+ewf
	o/Vi5J9/yBfMdJ7TAnrkjnRjBFfMIMNOkzi1kRUgBaJCDAbrs55B7K3xyeqPxWjA
	6wN4aQaEbn93ODOp5wcCbeD11/CYMZT36zZOW8w1USttzBIQPMsCph/F4NHR3nS8
	hhKorIg9v9/euEJ8cipNKVWdEZFhrqymKX0dZQPP/wmmuSutRuqj7ctdv0WGlU8x
	rOlWh2SqiexVBYeIlRRqyafxX+raDffXKcn78s24lZbPd4iox7ONlo9Jpp2b+bMd
	RR7h+Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04vtjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-848860def2cso10698565b3a.2
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544647; x=1785149447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yjX3LlHlsVHojRvPM71du9cKmTiXYa777UZyKZrMZ7g=;
        b=XKG0k601gJ199E/huAsGAWPZUM7KtrTu6UIi2amwvQ1ZEX5c2p+HwVhGzy9T2A0T1Z
         Q3xy8oWQbjKqe/7MJUTidoo3uWImBLK37AQydwoRyIYqAg6cmaA1zk6UW6zRIJJ9Rghq
         eYfQTDEi/2m8Pc7aKPEf1/np/mHK+aYNWo6SjLmKJofdxBYzsZ4fNa8XgjdLISMBp+yn
         aISq9wP9HQn0kCYfMO9Ngc4gHW9fTaDbYrloPaUSVCQIcOni1idSswSROzmnv8sMF5iM
         qqKHu+SMEQYsBAkp927XPz/7hhhhn1f7F/XwUK0ucjQ9/sqy6/7+QyIg/86okJGzNlnw
         3+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544647; x=1785149447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjX3LlHlsVHojRvPM71du9cKmTiXYa777UZyKZrMZ7g=;
        b=QnAsSsIVJ+HPw4TH40q5ZxZXe5cvzmEK4hNhdfRBGT+3NVUxcZq12l077NMu8Vwyt/
         ZdpbKW3cc3u1gEPOr4C8mLrvO4cxefRH51D/RmFVx/WLKkJUy6mHmtFyjrMEPgoLW+2p
         WhV1j/EhUpE6t5PJlvKx7Y2/e1+/fBUMyVQGzwlVh+6NI9INPVxaM7FBZblGdTAw3DuO
         NNfn/gdKZQ/HhvH3/tqdaFV4dHXwNzxRvTG9Xsili9mgnjTS1mMQ35frf0QPaM3/39yk
         KhAulVXii4fdmiTUVnTUZDuJ3o1LmkzQzayrIr8UGneriPJOKxETOvEXi9f4rtXMxs9V
         xCWA==
X-Forwarded-Encrypted: i=1; AHgh+RqNIoA5sZNGh7gDxOkZodiNyDhBzteRsmLxYqrLzgU5R9NAkdJEVQWrkaFtnOD3v6H0Q8V05xDDOuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGJgnoG2NEuo0pnT26/7y1ArIbdJgs0u8uUJFU6paY6jTFcxl
	UhaDXINs3o8wU4dOtlWn3iWvnkoZsaB7NW5bB9RSCd3WttfVTWl/YnAhZPLnpyoUnygxu+KCh7t
	el1V9HthNsk9KWgVmN0qikdVmfT9qX8uKPnkjdzFH4cddFQ/7AKUsIGUSNFclhLE=
X-Gm-Gg: AfdE7ckJxLtpmxzHqdTbjmtpoOQKT0oabHMOWl9MIcBVgW78Wq3hqiXDJiRjhC/rbU6
	clRUotCVpyL48/u+l3yZKHj2zrz30xmszMrn0EA5vQNGDbU/GTHC6D8Mh2EWZ/lSCRcWiOqay0O
	FD6NtUMawPJp1pM68fyuDqDr6spMuq1ZV7fRtVcquW4as3UE4dc/ghf9xNACwe3ibed7mDicnRp
	BuWnysBEpShygTG9jH2MT5sER8PU349Bon1wLwVJhXhR2xpVxUhVPGgBpF9jD1QxPf7sX8mh7V0
	4OGpgxeLpCJ6O6pW0DKLigbx6igOM4iu0Bv2/6pGEzOxrQfPi6saP01xymFiD4qiYzLOWiTDcuB
	TMT0xAAxwsfLznvM=
X-Received: by 2002:a05:6a21:102:b0:3b1:a9ce:507e with SMTP id adf61e73a8af0-3c3ad80f918mr15046931637.32.1784544646746;
        Mon, 20 Jul 2026 03:50:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:102:b0:3b1:a9ce:507e with SMTP id adf61e73a8af0-3c3ad80f918mr15046898637.32.1784544646232;
        Mon, 20 Jul 2026 03:50:46 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:45 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:21 +0530
Subject: [PATCH v7 05/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-5-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=5353;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=cwo48c3pu62HWaDduZIiYL7P/xZdyoCCNEnXn+MP1vA=;
 b=jVnZzLnnOfX6DOCebBcPcBCEov2iTIJqr4G2BZ1sAiclh3IodXbdiyOH61QxgXmO1X98fmn5P
 KHd+KbK9ZSPAtq3dlWXGQjLNQwBA9hDh/ctgThHTE1ZZaATLEP0GXax
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5dfd87 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX5E6TdZyIx9oQ
 ypxRCZ+rPvkBS+WNjJYHwTcqFCaDBNQz1dxeDoE8b1PwMjBtfMNtIpxYXSQuUj4IZCAaHnv+gH1
 PmtXmiOvaZPfkY51O/a9fALriegzhf56RwwF2EofePtbdZeFu4w2YxKirOQJdh/sLBj87+DBxDe
 yjUD20EX6zVZNeXDOgFWFHWeMS1Dny2q5gZqCJl4Nl2uG+QU1YrYC/t0JoRnJlK/0nZu/WaQ587
 2nbu79zpPiz1iHdKEjD8OWXR4WiN3wFobK9AiNT31ZvM0oQmyeKapxcvptW/vyFExF2XbEmFHUe
 k5a7ftk1gz1wj7EJaWk6De5mUQhFpfJAkXfipOJEpIB263jNRsia73Q/GrqqGjAM/OqEGWzXMZs
 Z0ldb1Pd5qykBfgVA0krvnCSJ0I1GkpTn1/hzDRNl1IJSd68mVQgdXgDaXnE/cBqy2Jo2UtGR7R
 FnAxQegqJqsn+DxNzNw==
X-Proofpoint-ORIG-GUID: im9gQU7M1irv3293LHwxFIFpVQ1BEOF5
X-Proofpoint-GUID: im9gQU7M1irv3293LHwxFIFpVQ1BEOF5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX532iTYKjdXeU
 fGUkxLKp6qpaJLpV2+kPPV/uDCEuT6c7ssbetBs3MKDg6OcpcV6MJ/HSia7ReXFNPS1P22v3XmV
 OeSn/KdM+Z5r8slxg06H799hLI3d+64=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

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
index 53dddf35963e..12e4281f7b35 100644
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

