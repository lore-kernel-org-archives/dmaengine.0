Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF54F3EC8;
	Tue, 22 Sep 2026 06:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059840; cv=fail; b=kMVyDhpPi8kG3WD1lZFmeUefXcCPcIuCmx15pyV09mzf7WKB+QxSxOF3mSpGHIaiTb1O5DhR6EPZhQzjs+up6mHs2LnM5vXbBZD3o5LCP/CIryHK9R7wuLH19RPoyeq3akMuTGubeoFTJBqflu/ah5mh25jFxhan03fftF4U0to=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059840; c=relaxed/simple;
	bh=Eme2xSy2VfiQ7P4WARJMbEdhgm1AaojTY0SLTbQoBzw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Idi+aF7FxjgO1DRIn3uaGCS3zvOar6/smo3zP4k5intd/wA+IQ2FmhKy3cUPGb6KZre3OgtrIP1/yoPWDGmkB6Nd9O+UfSNyR/kKj+9hWKuDVR5mjVDQDcUH9jDm2brCfkh5quGncs9YGRYvepCFtqals/rPtgSXszjWAmVtPd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=LaYgngf7; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aBJ+0/Vd; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="LaYgngf7";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aBJ+0/Vd"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2UInJ1034837;
	Tue, 22 Sep 2026 01:50:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ufS10IuV4rNPlv4A6/SND55bzkb9Kt7l4TDzuRCVL
	A4=; b=LaYgngf7CIaZ/ZoIW7+VQWHwgjLutwpHaY2e3ZhdJNaYj/lyTZs7hNQKu
	o+28G0dVyUbThSrnuvQKtysXpL38eYTfX77aZwsfUEqr9a+Jpn5d/lLfoDtoujY3
	HZlRhQPkd3Sf3SfP68WSIasUVHq1QzJczF0e1pVIxjgMCSb5xWcPtU4Pk58IlFRt
	HCXJENy4O0OaJUkM4G7YxU6CfPOSnwKMz/j9XdxR4tQJiQeQxVThpL9olcTYm9oO
	NgelZQ+Ui2Qw3CYjLcf71UUV6CgwpTk5oExjQ/CYpjb/3gnh1o3f1F4l+jX2e5wY
	/rKqTBmYP5DDcXKLucxgi6Yg0aZMA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16hq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tClHLkXKduszjRfz8H8VpQ4LXCjjRa3KFiGR2O49quIiLQ24RNnVtQ4MW/FvTJ0msJ43QaT5nRTBoLlatml7bWb6MMzNAd3jls5wVXAfks/ufv1/7yTA0GMGMes5VFhAw/lVK/Vy8QtRygZHSwLUJqAMRHD0q3isM0VuiaAlZ5gbpBVoSkbmSRcBORh72paGeBSIGT3y/SbHHjdj7a5Z/8ccHMudDTI0EpXSYfhl15Q5eq+NpcdL8E3ZNirimNo4SP+jb11oP6Bdl/5y0vCmsWM0gIrqxM8glQpcHLdGhG6n7/QAKY44d7Nl1OXHSJtDn0gD95n29Rzgkeo6RYxSeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufS10IuV4rNPlv4A6/SND55bzkb9Kt7l4TDzuRCVLA4=;
 b=scQFI4bIlN31k3LbWeleaHYKt8Gm8M1sN2N5k9wlcInkXwKeLe6yitWcMs68XCFluK1lgZaXWBZ7WdHKboLuwqK4TdcuwT0mBo54zTw1jztvUcjOpS8tMxHPI3A7sGOASnpDHz4/WPwCuTW1BSyn6CXCd2/f3+1IAX4U3YomlQuWmCfWmrBdbZkH8cZibm8hGss/YhnBs1/GVOxJ58FC+3bWx7t1HBQqgLQP6gp1vOxXAoWJ7ocpUkLhtyBDJX3qr1vOk05c2UBpOmxnOJE9eKPYYSzbb1KpincPIKodc3bH9BAUqjq3T5PjU/dIexz5tkGqrY+4oTb/Ni3FnbpbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufS10IuV4rNPlv4A6/SND55bzkb9Kt7l4TDzuRCVLA4=;
 b=aBJ+0/VdUY+HMr9OSQtu6Op6xvInj02O3P/9K0bXpVCq9SvsTDBXn3q/lUBa0BkSe9qfbHTslhho+wXuUt1YjXI/XwHhpY1iseV9ZfdyLqCDr9VSiWANoGP9fNQcmPKFl1y/CShNqLZkVURFTsHDLjIQurwaqGw8oIf/9gDrWKE=
Received: from SJ0PR13CA0051.namprd13.prod.outlook.com (2603:10b6:a03:2c2::26)
 by PH0PR10MB4584.namprd10.prod.outlook.com (2603:10b6:510:37::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:00 +0000
Received: from SJ5PEPF00000205.namprd05.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::8f) by SJ0PR13CA0051.outlook.office365.com
 (2603:10b6:a03:2c2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 06:50:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000205.mail.protection.outlook.com (10.167.244.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:49:59 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:43 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:43 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3u3626771;
	Tue, 22 Sep 2026 01:49:38 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 04/19] dmaengine: ti: k3-udma: move static inline helper functions to header file
Date: Tue, 22 Sep 2026 12:17:28 +0530
Message-ID: <20260922064902.2719979-5-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922064902.2719979-1-s-adivi@ti.com>
References: <20260922064902.2719979-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000205:EE_|PH0PR10MB4584:EE_
X-MS-Office365-Filtering-Correlation-Id: fdefe529-f819-4408-a1bb-08df1875b8d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|7416014|10067099003|6133799003|18002099003|22082099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info:
	mxjypzUT8SRyu3sVYZ8ZgpAySVCs3V8fA7u222NZzZ8J5x/rq/JPiBxAC7Vf6V1w2eR7fwoVl2uTLM+hwyI2rKoWe/N/lAsEWNDlB6rwdu5SENlHPgl2BCHRrJaON6l+J6bA2/99J203PGQemG/1ZXkJBBxiro3mfbDftUQN+vEJHVvCveYm1Ur53Y97kmPPSVvhySwOMdCfOcrqMbaIPgzGJyWKta/mecNO2judaNrxzga2Qpkej2N/JZX10u3PSqN075sEZJdoUWOiNyknOc5uY07GaVKyBS0rJuSFI/F88EkLo8KQQgCdpSvKsM/lnY+S2cFlt0sHXIiPzEgLLfZyMExaTulgidTc6qPtTtUymGuN3FghU5LPMa9hKZ27HDFGvqjBzD6sh6TphDk1TTDS2ydT+dR4drS5OhUSiHsZVyrn9XPLP/cyeKQAYmb69ZUniUD6nXrLaNZkDmYthzCK5MFSRpulBqWyMGpJEgZbzzwrwPdBYDvju4kw595xysG+M/cFk32Bm9YilzRFEoeIrskRfbp/dfs3ocDSQjSNHc3AvoDPOO2oYP57FulCPB5t5zTwnruV+8hAIuoRFE4IrFKdIreeUBFZiElNClUdPXAhOwNBnQNzvLAeZBIoh8Hdz5nsLifYwvFAtUpmsP3qin2bGd0ToNGlUNPwR0BHuauYckQ9oSaDwrMn7xIx5eJ6Pz9p8rlEZnbGvp2wduLvRlGxeAkUhfLyJNZrW8GNbWKRaCzHe+7vM/Itz6ye
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(7416014)(10067099003)(6133799003)(18002099003)(22082099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1sfnBqyBGc15sbtCs5KX8ljdQtQPUS0BiIzv1CpRtqdWapajbQHA1uG0A9THJo9RrvNOccmC6qZ/4rdKcKVPkI8stqTqdMTSK9ue6B0fKHAL6BOFpH8sPPZR4IKl9hJakzUwqsAL+55HLLNDFhuYNgd6LWy7/L6NtdQwNfGc0d7HHk2PwdGEbbDwRVYdBXcaLBKBmVd24YduFv/EFxKbOMKqLh87hfv3TAs3fnpTvvcFzMqnps5gsYWAmNfHJ3ypN4K8oSnaRc27cheoAlyJkwCOLT+pMOePynnK2aKAr2wNpq6Dc+rwNWMwcq54cF+RW2OeqxsQ5O+OCvpaTxEVsvbffvk3Tw+PzwRBnVKqaa9tSWqaqR7Z2efXsgvlqdCkBDXMEuNu4wwkCFGV/SdkiA9ETCiYdB/UEnICi1iJymlcrEmQz4RtOoOgEtRpb0U0
X-Exchange-RoutingPolicyChecked:
	whdHVL+irXKgT5v59llryblTac6AKo6d1EBO36rPQbn1hTFC955EtyUaiAJB90ZTvlbd4fmCrrhrr1gJzoghFzfUsyfjlpwqdwgQXegUlTRNtH+TAhLxmoC2Pu+L6Ju2dRbnWyzoaSZrZVxIwx0sC+86PnPoGQ4fowSQ/iVmqnPN9/MBOZKb+l1IfW1VmL1GgbeiHrEXqi+FFssLPdz9mnIlHGwl10rWhEGjOztropbyrEC4tGF7Ez+GB9kr1rmQ67629J3/io5Ih2rxQTWr/ER+pXWO9KGcJDlUaoFSUNuxVLn+YBZGh3zZbkWtNGBKnjRQxVH267t3eOndWTgBwg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:49:59.9989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdefe529-f819-4408-a1bb-08df1875b8d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000205.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4584
X-Proofpoint-ORIG-GUID: 9flkEWxK2dCe6wylLY3cRe5G84mvq7CX
X-Proofpoint-GUID: 9flkEWxK2dCe6wylLY3cRe5G84mvq7CX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXx8Wb3VAUdh0N
 yUh2htiuabL9Tn5E5Sx8PiY5nh3g03/uUwglmQHO0TfPO+nKsOSh0Kcv9YynuDXcalD3sg4iXm0
 siHBCpUEh91lkhCfJ4xwSaDHssFGB8f4ywrRCirmrlGz1k3YM5ZqzSiwlsHNolIOuSw34M5G63p
 Xeiww04bk6EFJtmm7PloQNBuGhUZvNzdAtqRiPsdPSrYYDIvn3MX+nP3c8cqee31uErqQbusDWC
 LPOSfuAnI8HQeMT1zNMon7rBSV1MIfdoDr+KDzGOL3hmVBxtFGNMmLyhcAwNeOt/wXhMYupxNeC
 uVCDc997o/QRc7tuPbNIWj50Ir2lOzgEDr/KBnRJGdna4Vview7E7QH0usIr47+GULwl0jgYNRu
 zwVnISdCOeNmgKpoWn3MMKICP3i6CKoYlD5aYHw+nWXqH4vGg9g/fuTybYg3XwCmjMl5LMveqVG
 ylIbkO/rQHwzG2l9QGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX7fzjh6pQmcNX
 F1R8qDLrvPPkqXHwpB1Q+934IIpU0d/r3Ougcyjgr28WxioaeJKEIIY6/LB0sQ9xYwhYnwxEYf6
 CzkNJSU62hMsPkAAc946hy+8LXeStOM=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab22521 cx=c_pps
 a=G+edI3GLQse3gACT8XNfSw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=grpEhN_aSmkWsCgVS3MA:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

Move static inline helper functions in k3-udma.c to k3-udma.h header
file for better separation and reuse.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma.c | 108 --------------------------------------
 drivers/dma/ti/k3-udma.h | 109 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+), 108 deletions(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index d7c153c5321ea..5336ec9fe79ce 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,91 +40,6 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static inline struct udma_dev *to_udma_dev(struct dma_device *d)
-{
-	return container_of(d, struct udma_dev, ddev);
-}
-
-static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
-{
-	return container_of(c, struct udma_chan, vc.chan);
-}
-
-static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
-{
-	return container_of(t, struct udma_desc, vd.tx);
-}
-
-/* Generic register access functions */
-static inline u32 udma_read(void __iomem *base, int reg)
-{
-	return readl(base + reg);
-}
-
-static inline void udma_write(void __iomem *base, int reg, u32 val)
-{
-	writel(val, base + reg);
-}
-
-static inline void udma_update_bits(void __iomem *base, int reg,
-				    u32 mask, u32 val)
-{
-	u32 tmp, orig;
-
-	orig = readl(base + reg);
-	tmp = orig & ~mask;
-	tmp |= (val & mask);
-
-	if (tmp != orig)
-		writel(tmp, base + reg);
-}
-
-/* TCHANRT */
-static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->tchan)
-		return 0;
-	return udma_read(uc->tchan->reg_rt, reg);
-}
-
-static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_write(uc->tchan->reg_rt, reg, val);
-}
-
-static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->tchan)
-		return;
-	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
-}
-
-/* RCHANRT */
-static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
-{
-	if (!uc->rchan)
-		return 0;
-	return udma_read(uc->rchan->reg_rt, reg);
-}
-
-static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_write(uc->rchan->reg_rt, reg, val);
-}
-
-static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
-					    u32 mask, u32 val)
-{
-	if (!uc->rchan)
-		return;
-	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
-}
-
 static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
@@ -216,17 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
-						    int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_paddr;
-}
-
-static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
-{
-	return d->hwdesc[idx].cppi5_desc_vaddr;
-}
-
 static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 						   dma_addr_t paddr)
 {
@@ -369,11 +273,6 @@ static bool udma_is_chan_paused(struct udma_chan *uc)
 	return false;
 }
 
-static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
-{
-	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
-}
-
 static int udma_push_to_ring(struct udma_chan *uc, int idx)
 {
 	struct udma_desc *d = uc->desc;
@@ -775,13 +674,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
-{
-	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	memcpy(d->metadata, h_desc->epib, d->metadata_size);
-}
-
 static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 {
 	u32 peer_bcnt, bcnt;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 11d08adb0d69f..54e1757c3de38 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -451,6 +451,115 @@ struct udma_chan {
 	u32 id;
 };
 
+/* K3 UDMA helper functions */
+static inline struct udma_dev *to_udma_dev(struct dma_device *d)
+{
+	return container_of(d, struct udma_dev, ddev);
+}
+
+static inline struct udma_chan *to_udma_chan(struct dma_chan *c)
+{
+	return container_of(c, struct udma_chan, vc.chan);
+}
+
+static inline struct udma_desc *to_udma_desc(struct dma_async_tx_descriptor *t)
+{
+	return container_of(t, struct udma_desc, vd.tx);
+}
+
+/* Generic register access functions */
+static inline u32 udma_read(void __iomem *base, int reg)
+{
+	return readl(base + reg);
+}
+
+static inline void udma_write(void __iomem *base, int reg, u32 val)
+{
+	writel(val, base + reg);
+}
+
+static inline void udma_update_bits(void __iomem *base, int reg,
+				    u32 mask, u32 val)
+{
+	u32 tmp, orig;
+
+	orig = readl(base + reg);
+	tmp = orig & ~mask;
+	tmp |= (val & mask);
+
+	if (tmp != orig)
+		writel(tmp, base + reg);
+}
+
+/* TCHANRT */
+static inline u32 udma_tchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->tchan)
+		return 0;
+	return udma_read(uc->tchan->reg_rt, reg);
+}
+
+static inline void udma_tchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_write(uc->tchan->reg_rt, reg, val);
+}
+
+static inline void udma_tchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->tchan)
+		return;
+	udma_update_bits(uc->tchan->reg_rt, reg, mask, val);
+}
+
+/* RCHANRT */
+static inline u32 udma_rchanrt_read(struct udma_chan *uc, int reg)
+{
+	if (!uc->rchan)
+		return 0;
+	return udma_read(uc->rchan->reg_rt, reg);
+}
+
+static inline void udma_rchanrt_write(struct udma_chan *uc, int reg, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_write(uc->rchan->reg_rt, reg, val);
+}
+
+static inline void udma_rchanrt_update_bits(struct udma_chan *uc, int reg,
+					    u32 mask, u32 val)
+{
+	if (!uc->rchan)
+		return;
+	udma_update_bits(uc->rchan->reg_rt, reg, mask, val);
+}
+
+static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
+						    int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_paddr;
+}
+
+static inline void *udma_curr_cppi5_desc_vaddr(struct udma_desc *d, int idx)
+{
+	return d->hwdesc[idx].cppi5_desc_vaddr;
+}
+
+static inline dma_addr_t udma_get_rx_flush_hwdesc_paddr(struct udma_chan *uc)
+{
+	return uc->ud->rx_flush.hwdescs[uc->config.pkt_mode].cppi5_desc_paddr;
+}
+
+static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
+{
+	struct cppi5_host_desc_t *h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	memcpy(d->metadata, h_desc->epib, d->metadata_size);
+}
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

