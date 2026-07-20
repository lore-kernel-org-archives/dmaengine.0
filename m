Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453203DB97A
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544647; cv=none; b=QKp5hW3z5+rCWfFistIVSA+KjP5txi3H72p/iWSG/Aj+MpdTbHJLRUY/qiTeNZiaLQqQWV+c2fcdPN4lJt/7pZv3xpivQiz/lXTa8SqFq0WRlVT44IcIUr6sattq9T4rnJ4KqwJSzmbjsJbQ95fZKhcexB2jGSTf2tp0VhlpPwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544647; c=relaxed/simple;
	bh=2njLzbY8Unn3mSyRXWJM2yX7i/tGL2ovfQ0evn7w6Vc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DWQunKRdu71kPUk/s7RUALfm/bQZZlpFCSYe+iZFLDQ7shuYicFJQKc1mhu2yvjzDkXPpMPUJ+11Q4n1uRxRJkjWxnYwUQWgzdsCGxej2fuuJXbmJ5FGegniHc+7RQSDX+pLlyVkH/z0xLY8Kmvr0PrSm4SjbFTgZPsABwp6NVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKEU51ZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXngar0m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKEU51ZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXngar0m"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vbE42238493
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	80z04yj5XQg07vhnxx5JXgiciswuUX0lR8As09BTFfE=; b=QKEU51ZV+rEqbSju
	eGu8fW1/kO1FxS6RzzaeHaz7/Y98JYvROandhDV7RlQu8j8yTDaQwVKaMTGfutfc
	4x13U/Yci9P7wK2g1tFev1H7o/co/92hslGH7L/O9CAcdM3cBYBJOSpgbagS5Sss
	eZY4SI+pvtWG8YxEu+RgrhFxisj8mxAtPfD/VpcHk53vLypmW0LDkOnT3eI7FPyx
	uMRQbnhBKdGByHpV+w9d4xsClxKFCbN+E+a7g5Ke366FLBT5hPjaKwfNPARacCm2
	5PVbnm3swef1ll9JONh7tc01bcSqqCsbif6wQ+3ntnl18SFn/SKLHtZNvso5KVIa
	4Uk/JQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre8ddr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 10:50:36 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5bdd8450dso1650318a12.0
        for <dmaengine@vger.kernel.org>; Mon, 20 Jul 2026 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544635; x=1785149435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=80z04yj5XQg07vhnxx5JXgiciswuUX0lR8As09BTFfE=;
        b=SXngar0mdkAfiDU7RbdBiU9a6B5Bfs8hW5s8nDFaDop0pP4I2og75WyewOMVUuJUYP
         6VHU2RqMzzmKo0DJAG2HxgtBsOlY1SljRO+bva/reflPVKyYewP09sbtFVu74ty989ZE
         PaKpVK2P96D2Xww6YRojimZLWnYJXscEuZW7cMWqmf0idVPjNNHPDY7+n2oA9sNUwcKE
         oexD5OmYl0mk7xLNv6quT7dbs685Tffh+BLAsaBy1k/hknPt6zOppd7N0e6zG5CdWxqA
         8zwMSQhMaKKzWl2XE26kVmVaXlX2UcXuvDgkEWQ+3ijb6qorSjnUC1kwtPwErbqV8pZu
         PHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544635; x=1785149435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80z04yj5XQg07vhnxx5JXgiciswuUX0lR8As09BTFfE=;
        b=AKqui66pDskaUQWwrDliTyenhMRmg+xyZM5OTvbyKRHDK9mGW4E7fSVNNP+x9OcF2j
         JQ9Ip3HmYqmxK2cTV6TTOf7bEXrw8SjNwpBod/Oae0Frvizjaw5LKtgkkJQeHMPJKbmw
         3JCoGbvYtvf79wHjBYxkdriPDW8rkayOagpPMmtjwahRckIsoSGdJ5MX/mZgF3YUiepE
         1ZPw8vfREfsLtU4s9ptblryUGPoONUdq41K0Gi2xY6HevFrdzlckZq7ZqoahA2+JVofP
         LqO4lZTmkmAJeuQifq8IrZBG1tQfhTJnL1a/IsyKL7cy+ow+kUIXkFOGfJ1Rer5cj4dd
         CIzA==
X-Forwarded-Encrypted: i=1; AHgh+RpufR7am9KX7g/ENlWmtDYciemHgtYSjzkR+hzIL0AqxH276m5qFOy8Agy7rDyX/uK/+4+FvWCCT2c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHisHLPJw3OJIP5BOasrIFsPnOVEsEVjyZa6R0L98GDw2sMGPq
	nmFe+XA513CclqriQKNkwX9YO2fdZC2YSAre5zFMW1i9+wMeHbR6E0aa9Cu2UMrm44S4UDk2Qrq
	FjLh1cR0o+mPG8DrJSiFPt8MbnQNPs0FqPrxCor5JEjy2hmE5v63bOyTeh/XzHWg=
X-Gm-Gg: AfdE7ckGmiBaP9W0sDTd3cxME67qCiwLeXz/ddWX/CYXawnced/2/tDGah6k7E1l5FB
	gTq0GIi09nNx+O/EP4+3SFhCtF6HlZbLDuf4WWwq8MNENdHixmRx0uYTgMuaJvs2j1/0y9Xhs9y
	EbRTtVgIrXmyYet3c21nIykZjqTXEEa4tFNSz/KEOfRszKOP91Y/atDM89F3yidGLtHQx7b9MBg
	+qghnoJAtk0CW1GvnCxLCWIG7DSo5UppMrVyM/sL9l2KEeXZ6xaAZUjhL4/Cpy3y2EvwUCrrjds
	m6Ahf1jDAXYbADSF95sEBO5o7rUDmD2S0FfTf2s3qdjEn759sqo4dI+xw1UDj782FZWOdN9vqYD
	fXmjnfkx90MEnjxI=
X-Received: by 2002:a05:6300:141:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3c3ad88c1b6mr14722732637.32.1784544635045;
        Mon, 20 Jul 2026 03:50:35 -0700 (PDT)
X-Received: by 2002:a05:6300:141:b0:3a2:d79c:416c with SMTP id adf61e73a8af0-3c3ad88c1b6mr14722697637.32.1784544634571;
        Mon, 20 Jul 2026 03:50:34 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:34 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:19 +0530
Subject: [PATCH v7 03/10] arm64: dts: qcom: shikra: Add cpufreq-hw, EPSS L3
 interconnect and OPP tables
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-3-7dc99100c6dd@oss.qualcomm.com>
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
        Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=6550;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=2njLzbY8Unn3mSyRXWJM2yX7i/tGL2ovfQ0evn7w6Vc=;
 b=PpraK0+nJucey9rD2UwZB8qdVj9rC0LgIY4aNQNulKQH5d7H93mm7arOaxeBxy4fPe17HcAQi
 JqGMzKovmV4AqgEzvJNZwjoqwIOVSxnVlWzDWMrbKNL1YWrk3GJag3R
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX6dV/fBzRlGPj
 N9EGUgRB503mxE8VN2sTzr9sN5sK/GC08Ux811kPNIwVL9KFJQOU/SR9NF44DjsuSqUUreaEghq
 +v6ABP8fl27jseS4im1jEs+9yofDgQQ=
X-Proofpoint-GUID: ID8ixPBJVGH3wdT00yea6BMRMX6N9wGE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX6HiuPO58ugrE
 pzf1IP81hLrS9bk+Q8rHuXGswK49zFNiE7FX8suma+NJXuOJoYKy9cOSEF/4EIbGtCCWTWgMz62
 I+EyD44UVhd6+zlAg/LsFrVdXKVa2vyUhGZF7mXo2pR/oM+eRKEw+F06h0s8j9yWKqJCtjDk4G2
 HQ0WDumnMyn9b2Pncw6t+hDam1PvnsZ3G4I0gl1SMg3UsQ6kh22DvF9G+EAHb6MnFgdG8VYJW0w
 tI6epeZk6NhpnmOTN7Cko1Pid59RaEzChVRxDm+CtzqYBtDZJMw+bvWrCa+s/0sozSPi33dGEdA
 XnMYfsOD2VR7GZtZzEPOXj1+xriMsl/m7CCh0msOm5Zok8oQdiu/Io1VbbNsW9cbVD9QmvJ5fLQ
 om9RcXX53a4WM8n97mgznULZEBbmYDKLDJkkxtbrda1bDp5cBXernmK5XiA7khD640vm2PP2Cyf
 yu9j51rIMkD170Y237g==
X-Proofpoint-ORIG-GUID: ID8ixPBJVGH3wdT00yea6BMRMX6N9wGE
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5dfd7c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Hmkr-C8MtNtjzj7I6joA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

Add cpufreq-hw node to support cpufreq scaling on Qualcomm Shikra SoCs.
Also, add Epoch Subsystem (EPSS) L3 interconnect provider node and OPP
tables required to scale DDR and L3 per freq-domain on Shikra SoC.

Co-developed-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
Co-developed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Co-developed-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Co-developed-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 140 +++++++++++++++++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index d66b97dea319..26ae21d4c7e3 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
@@ -44,6 +45,14 @@ cpu0: cpu@0 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu1: cpu@100 {
@@ -54,6 +63,14 @@ cpu1: cpu@100 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu2: cpu@200 {
@@ -64,6 +81,14 @@ cpu2: cpu@200 {
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 		};
 
 		cpu3: cpu@300 {
@@ -74,6 +99,14 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
+			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu3_opp_table>;
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>,
+					<&epss_l3 MASTER_EPSS_L3_APPS
+					 &epss_l3 SLAVE_EPSS_L3_SHARED>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -132,6 +165,86 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <1200000 17817600>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <1094400000>;
+			opp-peak-kBps = <3072000 30105600>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 38707200>;
+		};
+
+		opp-1612800000 {
+			opp-hz = /bits/ 64 <1612800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		opp-1804800000 {
+			opp-hz = /bits/ 64 <1804800000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+	};
+
+	cpu3_opp_table: opp-table-cpu3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <1200000 17817600>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <2188000 25804800>;
+		};
+
+		opp-1190400000 {
+			opp-hz = /bits/ 64 <1190400000>;
+			opp-peak-kBps = <3072000 30105600>;
+		};
+
+		opp-1497600000 {
+			opp-hz = /bits/ 64 <1497600000>;
+			opp-peak-kBps = <4068000 38707200>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <6220000 43008000>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+
+		opp-2208000000 {
+			opp-hz = /bits/ 64 <2208000000>;
+			opp-peak-kBps = <7216000 43622400>;
+		};
+	};
+
 	pmu-a55 {
 		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
@@ -1820,6 +1933,33 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		epss_l3: interconnect@fd90000 {
+			compatible = "qcom,shikra-epss-l3";
+			reg = <0x0 0x0fd90000 0x0 0x1000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+			#interconnect-cells = <1>;
+		};
+
+		cpufreq_hw: cpufreq@fd91000 {
+			compatible = "qcom,shikra-epss";
+			reg = <0x0 0x0fd91000 0x0 0x1000>,
+			      <0x0 0x0fd92000 0x0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1

