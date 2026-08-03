Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA9F4028F2
	for <dmaengine@vger.kernel.org>; Mon,  3 Aug 2026 11:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756446; cv=none; b=XKW6ftpVquLV4/Sfdh1FJVG/QJrbUnnNlJRQlWivKqQ5B2GEpjLRc0y1ICn7QGy65ZwEiv9M0OLFkMHK1uqZPsxQBJmy4o0ADGAR69uWasDYfPgJf5nVzDJvxSPjnoyL7DKplcN8/hrbPFoxo3fMBK2/w2SQcYyO6eAtvZkp+6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756446; c=relaxed/simple;
	bh=W+J47DLyzKHe2QopLDHxTslHmL997c14k/yofWkF6Fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHu3xuUOw3YUrw33We/I5zdOiijDW+Mv16HgJ78d0Yx8I9RxzAiLT6AtUibjkq8sO8IyxjV8Ga6uDPmbHef56zRV5prrUDXODCrIRLfF6/0UrcxvkLM5Itbjb6/OugmUo4HDZMboq2nMqzBW1Q6swyQrHQcQ9UJoo01hniz1sNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aD6pkQOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R4WHoKdq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aD6pkQOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R4WHoKdq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AR5rp250043
	for <dmaengine@vger.kernel.org>; Mon, 3 Aug 2026 11:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=; b=aD6pkQODAnkmWHVr
	c6cuyGiillAX8wRdF78niLwxbH0dafWIUK4Fj2bC4c88EuTcks0UFQ2LbTsMjigM
	XxKQP0IsG7SG7jucKNLXEZzeRtCklze9Rjo96bhpgD/FY8G3eRf5dfDJoISZEsQS
	VeYnjgT3KwGJxbw8JqzAIEhHYHxkvLxE89ppqsf5Wbnps22cvHIabAzkyZvYiukB
	KEN39E/siliQWCoAVK9mwWd29e6hxy9oeQVmvw5TlBw0LO6Q5nh0dFbAifj1ITeX
	3XNlQcPrnm6XEPqPS37ug34sCkyxvyZliCiy2v0+BcQfxk0AKS018HXK/46YPun2
	3MBf/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd98k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 11:27:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso4697927a91.2
        for <dmaengine@vger.kernel.org>; Mon, 03 Aug 2026 04:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756444; x=1786361244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=R4WHoKdqsVfjVaPZ7uq9zT1P6AuKBF3qJkrvagjDhl0STnVOzStZtMU0gpyyJz9e4x
         gdztSBRxEBaBWkK7QIgv6os1ZAx11EGj7rUIqt4ZPVPmlpsloTxEOwnq5ITpeRIJZ0zl
         nas+j6k90IqKhPxqOCgdDir0oiKRYd1gceq09lnKhIqxVaajJ1cQfiGJrxuT1JkU94jo
         JHTifgfuuCvwbe7Vs4vnOMjvg8ysMBqMw7/VgOL64VwvP/zPD+JJI2N/pTVo2K3VVwGs
         SB9xjrufQod+9e8Sq7zlXcQIuYWkd1w4dPZCRmdrf4eaZCbKmL4D/dJmVvhggnwpKNuK
         /nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756444; x=1786361244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y5q6T1WOr2wk4M+dKBh9beKBFr4ByevQ7VYwHg8nO/E=;
        b=bTq/ptHjcU6XJejJBrfLyKUuWxyvlbOiyHom4+Im12g+rg+LJKOXDNf1A4smhOH+Kz
         dLCXvr5bvQK8m7w2K9lcXU6ptQK+lJOyGolc3SW1N7fYhgTyAJuEWZOwg8T+V1o28614
         KndqWbW8+CYfOXm2068Zm9caOfChkKXf0G+/AZ10vzr1ecA0PeOB0TlnbYsq7ouBNMO/
         cNorNmaE0V/4ilTqEEo885pRs2tGQ0nuBKzQzxejKkw9654EBPw7AqZWGfGDupmHiIiu
         sfid0E+zVAXep/r0HChCK820w+ovTnRRcrBcEAtklwPnpl/DtiEbFRy3EIgsPXRw2OMI
         5yQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkgeAiYzDSLwBsa+NzX5GuaLnQ+Ucgmus/DXKJDduZ91l87IHGXT8Y8PujaMxWhkpFwxRz3PJWDHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWRQLlSYWzJKHqgFuwUGNMwrzfHzkoxWR3MmixqsrjgKYW2kcN
	AABh0YPEkM1PlStYDjgdhuBeQeP9HYJMw8+gl0pP714lsWJwEg5Z5PNiE6h/0zb5nClOZNop+G8
	HWjlAn9FAGUUR5CGj8lEvfGjiHaXAysVz2IW6hYBVj2OqEsn+bqg2duyiBe0vE8M=
X-Gm-Gg: AR+sD11IDHgi37qxdVOVkwNeyoDlhOC4jufxhDsx+5wv9z5aoFEi05J2oyAdNVbI48T
	C4HPsq75QZ6oksy94zgTzi21Xmn4XfEKcMKpInsJgtEB2lY5Wj/d+i0uQZNwAcvC3QpMKfRFDxI
	XmmvwPx5qUFlgX4XHtw8U1wv5vsfOGLrHO+1E2A6e+CvqjPqg0MLtFij5Q9rVFj01bMJ3QIO26G
	O+Kc+MWtj4dX4fhJ/YXDLTG3x2/UjsigIwoKpwftrcJblgt6v/Sz9yRW9knx85q6J2A9bGFYw1m
	IHBzYPys4ZkrOkTx3in3o06ZO1x3Q2i+AD/SOmgXcKRJsQtP20WySrNdIvzqmdrUa2hEtLdg71v
	W5Q1dEyS5w6Vh2e0=
X-Received: by 2002:a17:90b:2604:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-38fbc414a45mr9636368a91.10.1785756443686;
        Mon, 03 Aug 2026 04:27:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2604:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-38fbc414a45mr9636338a91.10.1785756443256;
        Mon, 03 Aug 2026 04:27:23 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:22 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:35 +0530
Subject: [PATCH RESEND v7 06/10] arm64: dts: qcom: shikra: Enable CDSP,
 LPAICP and MPSS on EVK boards
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-6-7fec8e777076@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=2699;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=B2Dpn2axDYIMHLk1wigFR9Q2p/KX8LBdfSSHhm53znE=;
 b=3WW/jjVoanz9dGGn8n7Xshe3VA+MsMAPWlb/jTF9G8BpIiqQ6uuAEhirn4hQabaZAXkL7dgkK
 +WM7KzaEgThACPVMVg6h6ZMom/Tt4djsTSv3ukejIESEuCr6SpU/Txy
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX5Qtnvp8AtG/5
 MICEQHizAcb6AAsGfQqQ5saByZespRaFXzuFNGbig8U3fkw2e9IM45dNyDDs6gZyVaeeSXEDuao
 C+VaetDC63BID3L7eFWC/53bXl4rn+A=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a707b1c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nu3v8zf0uA-Bo5sjUnsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4Yz6EqaZXctUz_h-ehVEHx00o7FG3sDX
X-Proofpoint-ORIG-GUID: 4Yz6EqaZXctUz_h-ehVEHx00o7FG3sDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfX4vOLDt53bbdn
 VQ87m5AlJBw/5oew+eMCi9p52QqJbI1Sd7XSyO9nbpLbGJnBWGitZUvdfBjiVSHdDxrvxbDOZ6I
 aq9Iu66Q4fPr6IK14SI4KpI9mmjuDQwSCEybJ1wIW6rTe2eDKKDq7zl0MZq9t0xbqQFnfCEYbII
 3fqWD6jPcFSaksLhxK6Pq0c8/N4zb1wu/gYOPJoljYc+Ft94zaUc2lmUt6e9NODLJhXYfcIGmh2
 fQd5n9ykawSh04sa/gCjElIG9IX/jzb3O/8ecVBB7buadoAthxYy6gZ8gKYasv8p92FkVWLoKQG
 ij/uz0KLnT7yehqrvZ7gIxyu+5uUDFZRqeyf4QmOPguAFN0RlvyibT0MZr04E1BnLfUgP+vk0f3
 H8nBwptqM4KoDgl/hTxbHnNs+LUhff9tafJddOUtwElaVpzRPAhl5ozLEO0L6eS/pZRe1Ot5jAh
 pZl9wd5xOHGNCe/9rgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030102

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Enable CDSP, LPAICP and MPSS for Qualcomm's Shikra CQM, CQS and
IQS EVK board.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 19 +++++++++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..b112b21b1d79 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqm/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index b3f19a64d7ae..e62ba5aef71f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3003a47bd759..727809430fd1 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -23,6 +23,25 @@ chosen {
 	};
 };
 
+&remoteproc_cdsp {
+	firmware-name = "qcom/shikra/cdsp.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_lpaicp {
+	firmware-name = "qcom/shikra/lpaicp.mbn",
+			"qcom/shikra/lpaicp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_mpss {
+	firmware-name = "qcom/shikra/cqs/qdsp6sw.mbn";
+
+	status = "okay";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;

-- 
2.34.1

