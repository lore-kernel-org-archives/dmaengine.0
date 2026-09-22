Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54FB4FDA59;
	Tue, 22 Sep 2026 06:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059883; cv=fail; b=G1aBdCJckE7RPekEvgKgYSKEgEtH++2WqTUmKE82VLyaOKanQhycYTlg1jAfTRq6fyFHcQTROhe2PiiQDxtF9VRvNRswhBk6R/DNTIMxw/Bpwuo+R94ivviGQkPrFMfGRN+zmzQD03xkj+U1mIVf1lWlUHnOMFVaznCuZSnt2t4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059883; c=relaxed/simple;
	bh=A2P2vemd6JRBWLoyc+qomC7VKq5LpNBDddtH4AxqhbE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XP9K7fC9irx9mLZ4CYoqJXf+Tbuf+lVMeiASnd8nTOcYyk2zdN2AR9/aCf0EblAxTmvNXqC8yLaR/NDFSY2kvJudei/NyJ94MWNlD/GGqIXQHllt+IhNeoikJ3UipMGuYRxPsiHEcfch0c6YFPHAOMsM/N3jll2Xa+J5plEKSWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=HPGxlbTZ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=SbsvI+wf; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="HPGxlbTZ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="SbsvI+wf"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68M5rBwI932459;
	Tue, 22 Sep 2026 01:51:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=5j/umJCJf+JShg1sYVAxj1kRv5HnjgoFZOFXei055
	FY=; b=HPGxlbTZ5gw9kCGUJwBiDFNqo28F2ofRTwHrEKzo12flDV2QJyIPvbFx0
	sSyWd4tN3M7eTsGNq9PKOeU+sN2MJFeMAqG04urrK0CR3lLUrPj4p5lI5x0MJ/7y
	b/ZMgKR1xorEU3aNPwAJI5I87dkEyvYzoZclapFubpfWK8mHg80AIlmSDR0Qr5UD
	FYHaLVGap1Jv2zZkwQd4Mw3o7hpNv9Gg/x2pU6Pv421pGXq69uH8/0Zne1D6L9Dv
	LT7GTAjpIxCwHDi5pKIQTGU/oS7a5ANvSq6opAdjNFud+H3FhGW0jvoS+0QVoy5y
	u5yFNKRB/4vnG8yt/PCO6gZplMuGw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010004.outbound.protection.outlook.com [52.101.85.4])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x1v7e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:51:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWxmPSBVs4ccN2VKBdEzqQk7wbt1ZB/2LOI1r3VpxLerEXQgcffHRdqxn/CO3z54dbCBW+w32omDVfdpWGwdPd+QR7nuc0+GRL9/mRNStHZrTct3DupGoO5D4/InXyV+Ha4TYimrgHiM69nL/VbTHzmh0dY0nu4j0m+Sdk0F0iea5QeT0gUbNv3BuJUYwSExnS9e2Xfs7RSYIq7Cwf9PmSM6qn2TFqXSBjbnzPCyKt8v69lBr+XxzZWDSemb1e6usRMQ/88cJpqxjVHfRFVMFSZqzelSp1ajMQbakdHWp40VLq6pCuMTt6y1LQyU0xcGPkUj3t8/eydqIOvQyCrdVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5j/umJCJf+JShg1sYVAxj1kRv5HnjgoFZOFXei055FY=;
 b=EOsv+t2ABr0xo5NBJ7A/Jt6GMmjT+XHsZ5oOlggIKtN7KL7YzBZa4R5wE9A5PjLuiXz1CMKq+8NUkZrS9m3KCOkLAY2Ef7MyTrvrJ0ffSIVmMclXJHc11vh3uVV6UrIHMQeV2SwiJlSoArwIJ9hEWQ50Ec92KoP22oGAtQ7OeKGbEJZjqIL5gMgjYvzvgE0nVyMjqVj73/PVbTPi4dM2iTNHwa3KofGwuCVhip0PE0mJc6yV9NJwQrRnF/JspZtrzTHMHtYdN8qUHMgVnZwiXQEFa6ArcPWKSa+nOski/jdjTApT8UwaHA+gRtpzqm4aSQrGn7VnMb+XB1B3mbqYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5j/umJCJf+JShg1sYVAxj1kRv5HnjgoFZOFXei055FY=;
 b=SbsvI+wfk03iMpr5hBtdIDHhlsxUyo7vRjsg5C/v0Q0RBDhdhvh7PmkPix+OIraoPBXSFa0p4HDEEcLRPj/Lr+acvRwRGkv1+dLOZd76QEpOYn7yFUd0YpTGk6rhTXYkeQ4QZQYhTXfmjdsb0nuKYPz0KwJw3V8DSYNMi7u7iRc=
Received: from CY5PR17CA0048.namprd17.prod.outlook.com (2603:10b6:930:12::9)
 by PH7PR10MB6355.namprd10.prod.outlook.com (2603:10b6:510:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:51:01 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::6) by CY5PR17CA0048.outlook.office365.com
 (2603:10b6:930:12::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 06:51:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:51:01 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:47 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:47 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:47 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI493626771;
	Tue, 22 Sep 2026 01:50:43 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 17/19] dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
Date: Tue, 22 Sep 2026 12:17:41 +0530
Message-ID: <20260922064902.2719979-18-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|PH7PR10MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: be2644b0-4cdf-45ae-36d0-08df1875dd5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	x1zLzT7BU1y04DnBxjr7dKWU6r/Q/8SeIGMMu8sKzq6+E6yi+oezyi9ChJCR7taGB4PR6Y+g9V0hff+6IkwR9bwBA6nE93+DxP8X1gajLy2a1sr9GfRuorDpe+WTjWL2OK7L5/6pe0kPAHd2Z77UULC3QPUvYcdGA2p++MAFBFZEMkyDz2K9T09eexM7ojdL5FcAc5/PsBN23kX823ex8ENvwsVsTn0SpRfyesp29x7zip+6JZ4spFQGsbm5g0vw4MK6i/BhxpFS9s6xSE+MBn6463QVKIRZS4tsOjTnDjOXsdkzdidp7O38cemZjkB4OHbPFraYbnPtxsORAfL8jD6mLgkEdREIkbeQIuCSqJJzFkOsYX4TcgQ/9i9DWuB84O6XjqX46QIfRw5T8ln9s8tSSHcpnIMI04MTLfbL2JyGaLGvzj0rO3DCJD0sIr+XqCYbY4FppOiayH0f0HZnFIppQc0tHWY+aPpa1yauAJCA8qweetzwoQN0mQeIulZQFUeSWIA65EyGkT8ZSIbS7y7zvAcmDL60aqmTjDDd3ghhOItB0AzWllid8qKPWEa+3iABgybuAoKZ2aHaydAexbcYVbtVyLn1Oss5rQfuU13J7J9bSFk9BgqBceaySIx2hlwXbz2H2VYOLxMz6z8S2bjNdKlj0KAjlKrGumRHK8u3SYIbw+J7H8k7OnDz7SCw0k8bjmT4vtpLjrkM6+Y5wReEkt+vkhpxD+DcLLPNiZoJHGXgzIx2cxlris88mB/y
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ZvE/MBLPxG/2RtF/mQHIU2Fe+gvzN6sd6JwHsFwvoqf+A8ZZjJPdGi0JEi0FTgWdi+J8wXcHfGUulvOxVtVVOX56GkYE0UGGUdlCLp6wyFG5PtTU/cexTZzrSwtPtVlEPfdJyVnH9FKcAsuj1mtbMhhrN/DfraP7w+bLiPWAVGQRGfHFPfnbPnICSgVbBwvbI5viWfGj97smWxsGzNm8jBSxdM0Ncn2H3h0uxklIuTSVZDGGZCoTr5n4ZP0jC+Umb4ZZVxjDxgmAIhPCDDIfFmiA4m5HVEIXSmz8MwKMf+Gj+A9s0miJ5fp350NTPHlXAzJjx4aVUaILqtmuEPkNcFgRo5KEKS4wjtP9LRK2LqmV71XDGdA096D3i2y1B47M6bsaD1pDdgjzm2eokygBf4uXAeE00pVnT9arjzZLvI8DG850tMkBtju4ylZYeXI
X-Exchange-RoutingPolicyChecked:
	yjifSZ0LQaFLg7ZyqLmTDRrDyL75PrF9S9bFjv5gblNTwqEiZbwd3kvibDdQLUnwUIBbk2Y69vYN7ASQ0u8Sp+ynr9WkwvZLmzCK8YT2il3lt2sAvE0/bHnzJQ4bS4Rn2PBFqbwyTKhMJ1Q/3lRnbP0YCnNUOGaZeUSVdJzcPSyPpahS0aG0zRhmfDOxbKSPFKDVOY+na2cmGBP0gzEB2w0bqdrcTqOr24SLSuJAuPSWbyRTV2W/aTmyyJvv1KQS2LRTUB0OEvzUononFUCO7dWefisd3p2KR21+xmf1eYYRIt9YROLRoZdNcqjTJ8WJ1d9/ldHEDrEzSy4gKPyHDA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:51:01.2663
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be2644b0-4cdf-45ae-36d0-08df1875dd5e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6355
X-Proofpoint-ORIG-GUID: ekfjbNSqnLDOU2pakh1MCAFTOfZjoSfx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX7ZMy/cf3s6/P
 Q2fErukZDL4SH5J9rICbhccECYpISDyQAfkNqC7nYSIVFZ5HjL7d4+7e63NvJG9Lv09D92+U6yP
 AZhfTWoj33/SCqFVYZW3Lsti1rt/IY7NVDIUnBaizlqmw7B3ulQHcze+KaevOocIhdvUzjBWZR3
 aswuAiajP63av91DXQfc930aYVh4Ex2Wx/1ZMyz7BPqwq9P8bq1f8OnkhdqxSnROpnOT6iFWx0A
 NV+cD0w2HQLJw0lXdB7aiNLpB0mUldbhsqeTOda9GXpYqLGaA8NopB9OYe99/kTyR3WFuIOXgyQ
 tIQ6GwIlRAjB9U1wXte/+MRXpq3f67RAq4ODyWtNRGcM+o0CLlhHY5QMIPRjQmpTyDL7FUlWrDe
 ONMsq2hyPPm/ikBXC2xECeGv9Np6NwU8NONHD+c5b3PuUH+X6qkdGAxleisOUlw9/NluUaQs3QL
 Aowj6q60zzH/+yUNFwQ==
X-Proofpoint-GUID: ekfjbNSqnLDOU2pakh1MCAFTOfZjoSfx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX7XQEoXO3uJZp
 GZXuol/DZM2Kuj9kAh7IXSHtx+PQxP1kiBDVV8K4/ezBV09ZZAez7UzBj0rku2oZ7JzkF3kttUK
 pa8rO3qdoMJl1vN9UMcfyWh1J1UoUFs=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab2255a cx=c_pps
 a=GX94MXth5n4ySrE0IhOemQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=kuJ5fwJTF0DCxNmv2DYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

The PKTDMA V2 is different than the existing PKTDMA supported by the
k3-udma driver.

The changes in PKTDMA V2 are:
- Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
  needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single
  peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to
  PEER registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c  |  35 +++--
 drivers/dma/ti/k3-udma-glue.c    |  23 ++++
 drivers/dma/ti/k3-udma-private.c |  22 ++-
 drivers/dma/ti/k3-udma-v2.c      | 226 +++++++++++++++++++++++++++++--
 drivers/dma/ti/k3-udma.h         |   3 +
 5 files changed, 281 insertions(+), 28 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 1ddaab39692db..1220ac13c5fd1 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2462,9 +2462,16 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
 	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
 				  GFP_KERNEL);
-	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
+	if (ud->match_data->version == K3_UDMA_V1) {
+		ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+		ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+					  GFP_KERNEL);
+	} else {
+		ud->rchan_map = ud->tchan_map;
+		ud->rchans = ud->tchans;
+		ud->chan_map = ud->tchan_map;
+		ud->chans = ud->tchans;
+	}
 	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
 					sizeof(unsigned long),
 					GFP_KERNEL);
@@ -2563,13 +2570,21 @@ int k3_udma_setup_resources(struct udma_dev *ud)
 		}
 		break;
 	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
+		if (ud->match_data->version == K3_UDMA_V1) {
+			dev_info(dev,
+				 "Channels: %d (tchan: %u, rchan: %u)\n",
+				 ch_count,
+				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+							       ud->tchan_cnt),
+				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+							       ud->rchan_cnt));
+		} else {
+			dev_info(dev,
+				 "Channels: %d (tchan + rchan: %u)\n",
+				 ch_count,
+				 ud->chan_cnt - bitmap_weight(ud->chan_map,
+							      ud->chan_cnt));
+		}
 		break;
 	default:
 		break;
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index 70eaf7ee57e68..3721edf71f9b3 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -166,6 +166,29 @@ static int of_k3_udma_glue_parse_chn(struct device_node *chn_np,
 		goto out_put_spec;
 
 	thread_id = dma_spec.args[0];
+
+	/*
+	 * V2 PKTDMA DT specifiers encode the hardware flow/channel ID in
+	 * args[0] rather than the PSI-L thread ID used by V1. Resolve the
+	 * PSI-L thread ID before the common path checks the direction bit.
+	 */
+	if (common->udmax->match_data->version == K3_UDMA_V2 &&
+	    xudma_is_pktdma(common->udmax)) {
+		struct psil_endpoint_config *ep_cfg;
+		u32 psil_thread_id;
+		bool dev_to_mem;
+
+		ep_cfg = psil_get_ep_config_by_id(thread_id, DMA_TYPE_PKTDMA,
+						  &psil_thread_id, &dev_to_mem);
+		if (IS_ERR(ep_cfg)) {
+			dev_err(common->dev,
+				"No PSI-L config for flow %u\n", thread_id);
+			ret = PTR_ERR(ep_cfg);
+			goto out_put_spec;
+		}
+		thread_id = psil_thread_id;
+	}
+
 	if (dma_spec.args_count == 2) {
 		if (dma_spec.args[1] > 2 && !xudma_is_pktdma(common->udmax)) {
 			dev_err(common->dev, "Invalid channel atype: %u\n",
diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 44c097fff5ee6..525155d3bb513 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -174,16 +174,30 @@ EXPORT_SYMBOL(xudma_is_pktdma);
 
 int xudma_pktdma_tflow_get_irq(struct udma_dev *ud, int udma_tflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
 
-	return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+		return msi_get_virq(ud->dev, udma_tflow_id + oes->pktdma_tchan_flow);
+	}
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+
+	snprintf(irq_name, sizeof(irq_name), "tx-%u", udma_tflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_tflow_get_irq);
 
 int xudma_pktdma_rflow_get_irq(struct udma_dev *ud, int udma_rflow_id)
 {
-	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+	if (ud->match_data->version == K3_UDMA_V1) {
+		const struct udma_oes_offsets *oes = &ud->soc_data->oes;
+
+		return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	}
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
 
-	return msi_get_virq(ud->dev, udma_rflow_id + oes->pktdma_rchan_flow);
+	snprintf(irq_name, sizeof(irq_name), "rx-%u", udma_rflow_id);
+	return platform_get_irq_byname(pdev, irq_name);
 }
 EXPORT_SYMBOL(xudma_pktdma_rflow_get_irq);
diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
index 120c6d26a2dd0..b8047ce151b59 100644
--- a/drivers/dma/ti/k3-udma-v2.c
+++ b/drivers/dma/ti/k3-udma-v2.c
@@ -578,7 +578,7 @@ static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
 
 	rflow = uc->rflow;
 	if (ud->tflow_cnt)
-		fd_ring_id = ud->tflow_cnt + rflow->id;
+		fd_ring_id = rflow->id;
 	else
 		fd_ring_id = uc->rchan->id;
 	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
@@ -770,6 +770,148 @@ static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
 	return ret;
 }
 
+static int pktdma_v2_alloc_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+	u32 irq_ring_idx;
+	int ret;
+
+	/*
+	 * Make sure that the completion is in a known state:
+	 * No teardown, the channel is idle
+	 */
+	reinit_completion(&uc->teardown_completed);
+	complete_all(&uc->teardown_completed);
+	uc->state = UDMA_CHAN_IS_IDLE;
+
+	switch (uc->config.dir) {
+	case DMA_MEM_TO_DEV:
+		/* Slave transfer synchronized - mem to dev (TX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-DEV\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_tx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = ud->psil_base + uc->tchan->id;
+		uc->config.dst_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread |= K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		irq_ring_idx = uc->config.mapped_channel_id;
+		break;
+	case DMA_DEV_TO_MEM:
+		/* Slave transfer synchronized - dev to mem (RX) transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as DEV-to-MEM\n", __func__,
+			uc->id);
+
+		ret = udma_v2_alloc_rx_resources(uc);
+		if (ret) {
+			uc->config.remote_thread_id = -1;
+			return ret;
+		}
+
+		uc->config.src_thread = uc->config.remote_thread_id;
+		uc->config.dst_thread = (ud->psil_base + uc->rchan->id) |
+					K3_PSIL_DST_THREAD_ID_OFFSET;
+
+		irq_ring_idx = uc->config.mapped_channel_id;
+		udma_write(uc->rflow->reg_rt, UDMA_RX_FLOWRT_RFA, BIT(28));
+		break;
+	default:
+		/* Can not happen */
+		dev_err(uc->ud->dev, "%s: chan%d invalid direction (%u)\n",
+			__func__, uc->id, uc->config.dir);
+		return -EINVAL;
+	}
+
+	/* check if the channel configuration was successful */
+	if (ret)
+		goto err_res_free;
+
+	if (udma_is_chan_running(uc)) {
+		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
+		ud->reset_chan(uc, false);
+		if (udma_is_chan_running(uc)) {
+			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
+			ret = -EBUSY;
+			goto err_res_free;
+		}
+	}
+
+	uc->dma_dev = dmaengine_get_dma_device(chan);
+	uc->hdesc_pool = dma_pool_create(uc->name, uc->dma_dev,
+					 uc->config.hdesc_size, ud->desc_align,
+					 0);
+	if (!uc->hdesc_pool) {
+		dev_err(ud->ddev.dev,
+			"Descriptor pool allocation failed\n");
+		uc->use_dma_pool = false;
+		ret = -ENOMEM;
+		goto err_res_free;
+	}
+
+	uc->use_dma_pool = true;
+
+	uc->psil_paired = true;
+
+	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
+
+	if (uc->config.dir == DMA_MEM_TO_DEV)
+		snprintf(irq_name, sizeof(irq_name), "tx-%u", irq_ring_idx);
+	else
+		snprintf(irq_name, sizeof(irq_name), "rx-%u", irq_ring_idx);
+	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
+	if (uc->irq_num_ring < 0) {
+		ret = uc->irq_num_ring;
+		goto err_res_free;
+	}
+
+	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
+			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
+
+	if (ret) {
+		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
+		goto err_irq_free;
+	}
+
+	uc->irq_num_udma = 0;
+
+	udma_reset_rings(uc);
+
+	if (uc->tchan)
+		dev_dbg(ud->dev,
+			"chan%d: tchan%d, tflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->tchan->id, uc->tchan->tflow_id,
+			uc->config.remote_thread_id);
+	else if (uc->rchan)
+		dev_dbg(ud->dev,
+			"chan%d: rchan%d, rflow%d, Remote thread: 0x%04x\n",
+			uc->id, uc->rchan->id, uc->rflow->id,
+			uc->config.remote_thread_id);
+	return 0;
+
+err_irq_free:
+	uc->irq_num_ring = 0;
+err_res_free:
+	udma_free_tx_resources(uc);
+	udma_free_rx_resources(uc);
+
+	udma_reset_uchan(uc);
+
+	if (uc->use_dma_pool) {
+		dma_pool_destroy(uc->hdesc_pool);
+		uc->use_dma_pool = false;
+	}
+
+	return ret;
+}
+
 static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
 					 dma_cookie_t cookie,
 					 struct dma_tx_state *txstate)
@@ -870,6 +1012,7 @@ static int udma_v2_resume(struct dma_chan *chan)
 }
 
 static struct platform_driver bcdma_v2_driver;
+static struct platform_driver pktdma_v2_driver;
 
 static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
 {
@@ -879,7 +1022,8 @@ static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
 	struct udma_chan *uc;
 	struct udma_dev *ud;
 
-	if (chan->device->dev->driver != &bcdma_v2_driver.driver)
+	if (chan->device->dev->driver != &bcdma_v2_driver.driver &&
+	    chan->device->dev->driver != &pktdma_v2_driver.driver)
 		return false;
 
 	uc = to_udma_chan(chan);
@@ -1032,11 +1176,34 @@ static struct udma_match_data bcdma_v2_am62l_data = {
 	.rchan_cnt = 128,
 };
 
+static struct udma_match_data pktdma_v2_am62l_data = {
+	.type = DMA_TYPE_PKTDMA,
+	.version = K3_UDMA_V2,
+	.psil_base = 0x1000,
+	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
+	.flags = UDMA_FLAGS_J7_CLASS,
+	.statictr_z_mask = GENMASK(23, 0),
+	.burst_size = {
+		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
+		0, /* No H Channels */
+		0, /* No UH Channels */
+	},
+	.tchan_cnt = 97,
+	.rchan_cnt = 97,
+	.chan_cnt = 97,
+	.tflow_cnt = 112,
+	.rflow_cnt = 112,
+};
+
 static const struct of_device_id udma_of_match[] = {
 	{
 		.compatible = "ti,am62l-dmss-bcdma",
 		.data = &bcdma_v2_am62l_data,
 	},
+	{
+		.compatible = "ti,am62l-dmss-pktdma",
+		.data = &pktdma_v2_am62l_data,
+	},
 	{ /* Sentinel */ },
 };
 
@@ -1055,15 +1222,23 @@ static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
 		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
 
-	ud->bchan_cnt = ud->match_data->bchan_cnt;
-	/* There are no tchan and rchan in BCDMA_V2.
+	/* There are no tchan and rchan in BCDMA_V2 and PKTDMA_V2.
 	 * Duplicate chan as tchan and rchan to keep the common code
-	 * in k3-udma-common.c functional for BCDMA_V2.
+	 * in k3-udma-common.c functional.
 	 */
-	ud->chan_cnt = ud->match_data->chan_cnt;
-	ud->tchan_cnt = ud->match_data->chan_cnt;
-	ud->rchan_cnt = ud->match_data->chan_cnt;
-	ud->rflow_cnt = ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ud->bchan_cnt = ud->match_data->bchan_cnt;
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->chan_cnt;
+		ud->rchan_cnt = ud->match_data->chan_cnt;
+		ud->rflow_cnt = ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ud->chan_cnt = ud->match_data->chan_cnt;
+		ud->tchan_cnt = ud->match_data->tchan_cnt;
+		ud->rchan_cnt = ud->match_data->rchan_cnt;
+		ud->tflow_cnt = ud->match_data->tflow_cnt;
+		ud->rflow_cnt = ud->match_data->rflow_cnt;
+	}
 
 	for (i = 1; i < V2_MMR_LAST; i++) {
 		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
@@ -1117,6 +1292,7 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->reset_chan = udma_v2_reset_chan;
 	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
 	ud->bcdma_setup_sci_resources = NULL;
+	ud->pktdma_setup_sci_resources = NULL;
 
 	ret = udma_v2_get_mmrs(pdev, ud);
 	if (ret)
@@ -1124,7 +1300,17 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	struct k3_ringacc_init_data ring_init_data = {0};
 
-	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+	} else if (ud->match_data->type == DMA_TYPE_PKTDMA) {
+		ring_init_data.num_rings = ud->rflow_cnt;
+
+		ud->rflow_rt = devm_platform_ioremap_resource_byname(pdev, "ringrt");
+		if (IS_ERR(ud->rflow_rt))
+			return PTR_ERR(ud->rflow_rt);
+
+		ring_init_data.base_rt = ud->rflow_rt;
+	}
 
 	ud->ringacc = k3_ringacc_dmarings_init(pdev, &ring_init_data);
 
@@ -1133,8 +1319,10 @@ static int udma_v2_probe(struct platform_device *pdev)
 
 	dma_cap_set(DMA_SLAVE, ud->ddev.cap_mask);
 
-	dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
-	ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	if (ud->match_data->type != DMA_TYPE_PKTDMA) {
+		dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
+		ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+	}
 
 	ud->ddev.device_config = udma_slave_config;
 	ud->ddev.device_prep_slave_sg = udma_prep_slave_sg;
@@ -1148,8 +1336,18 @@ static int udma_v2_probe(struct platform_device *pdev)
 	ud->ddev.dbg_summary_show = udma_dbg_summary_show;
 #endif
 
-	ud->ddev.device_alloc_chan_resources =
-		bcdma_v2_alloc_chan_resources;
+	switch (ud->match_data->type) {
+	case DMA_TYPE_BCDMA:
+		ud->ddev.device_alloc_chan_resources =
+			bcdma_v2_alloc_chan_resources;
+		break;
+	case DMA_TYPE_PKTDMA:
+		ud->ddev.device_alloc_chan_resources =
+			pktdma_v2_alloc_chan_resources;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	ud->ddev.device_free_chan_resources = udma_free_chan_resources;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index b2e5455b1087e..2a9686f7a09bc 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -27,8 +27,11 @@
 #define UDMA_RX_FLOW_ID_FW_OES_REG	0x80
 #define UDMA_RX_FLOW_ID_FW_STATUS_REG	0x88
 
+#define UDMA_RX_FLOWRT_RFA             0x8
+
 /* BCHANRT/TCHANRT/RCHANRT registers */
 #define UDMA_CHAN_RT_CTL_REG		0x0
+#define UDMA_CHAN_RT_CFG_REG		0x4
 #define UDMA_CHAN_RT_SWTRIG_REG		0x8
 #define UDMA_CHAN_RT_STDATA_REG		0x80
 
-- 
2.54.0

