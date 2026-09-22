Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D02211466;
	Tue, 22 Sep 2026 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059849; cv=fail; b=ID/ju5czXwmKBY08TLm9MvpR0Y3nx+NC9ieQmMDSDqHXk8ks3Z5rVpeqbjenej1rHL6uMXrEkorREa0zPDWTgxgq+fwBmMuHEyady9uj+aH+TTZ30M1J2QUWEf240MphWkkfi2ioRk8QujAB2daysJJpHByfa6nlJyrPkJ6bIG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059849; c=relaxed/simple;
	bh=NKs96bFDGRUwGUx17Y/gdXO7sxNdXAeMS2yTBLYBaAs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qe7f02cikJhwUGCgjJBD2q+dhF0lWC4KwHQjAAFgBhEaEh5/wMt7zJek1j0UjXbKLiIXJGfFsOzWSFrPySZPIxjC3klwm9DnSI7XlsFiYMUfi+pWfLbpzUUMegHMGBIJelNNGv6zVxXErmtOBSbxzUAg7PaRUTGzpPLDzoyd9BY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=pgSzNWnr; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=RJzbExPh; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="pgSzNWnr";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="RJzbExPh"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2UJ2a1034849;
	Tue, 22 Sep 2026 01:50:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=a15/C6QzRzzsL5TYHeYHQt/0QQVuGNSGXjd2F6SNL
	CQ=; b=pgSzNWnrHLq2FmLw23kIJgyvxcRPZs4UNse23buiDpvJjQ9eSuCu5fhQS
	gpAOGJNLkKDG6xhX4790PGKMeaUvbd48zJ0BKfeMssGzKGXFir431ZuQ2aOuwEFE
	s2K2C1UoRgjS7anNSzPv7coiqlWC06VvmFC7VLpYD3DAyjkKTf+EpkwBBqGa/xw7
	GGjt0Owwt+5gGwIExtqmY15YZ71kBLyOmc8lgF5Yx2M4Wb706C7iJPu6HuKp1hT3
	GxsaEsDpPDXYd7iMUKeXAoBoFaEx2D/GlqDg6huEwqK1zEDtBF/ORQWc2+m+Sen9
	izW6g+siEe38YpKT4q+tvYYqMdtUw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011046.outbound.protection.outlook.com [52.101.52.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugxm16mx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbLrJJBzmCo1YDwvMJuHOLqhDNMSqs6n1iISCjlj8G/+369DPIPSqctJKv5+ebSBqpbtwP9QBdSQ7u+bfcRXTqSjcZq5OYcPcjZElEjMlGBCIwtevwRVr255JTjHsQYigEsa6Eno0gRQG2Oy+3jTwiRRjkLtE2gVo4vUyOh4nimYX/51cJukKLN8GyRFts4Ld+WLOEFLr8Ch+kOPQuZIkcKgzKahIbMPesLE/o/wVX11O38+dP6N4/J/NWthkveupa7I0VJ8nmyJAH8ah6HVGyZsmsYeVHwpJzk3Hf/r41uU20RCIoAPAjW1ZsNFJxvpdD5WQ1a4kAOopY0O1JOwGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a15/C6QzRzzsL5TYHeYHQt/0QQVuGNSGXjd2F6SNLCQ=;
 b=oWNWj0IVVmO26Dk2iYx4o1bFWW3JM39ObVYIwYNxaODVIUc3dLOVOZDGRrMkKh3soc1pGymPaSdzZ6xMokmEfu05MUpdyhG3CvpIpqWLWWQbbvpVRp9mRAQsibSbSRSgiD6ZlvzpCfP9R6GoxiiUvIsFGbFVlJmp1Hq1DemCYuy/UZmrxZCPnrvUafTeu4VsvVG7Qb9bQ9up//2kCThx4YVqhhdPzralXDA32nEoz+8LOHWIhlWhpAyto3QLY5B8UqvK4Ex6dIHjA7+DEsDPBsyxx1ineU5PNdA6WQH2MLwaoey9NkBStDqcW/Rnm/pazhnbDLpr/k4a9tlzi1OaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a15/C6QzRzzsL5TYHeYHQt/0QQVuGNSGXjd2F6SNLCQ=;
 b=RJzbExPh9rYWrGvmCce0dK/QJKDmvjvIkSdvot+z85jdSv6mFeLN/TDBygKtusEXKsHzJZ4hJdzTvrYzFa1wQi38Lls3olejnOttxx5PN5/XWXY+O6dN2YfbHUwT8C0Ndvn5FjUS/cnVl7bCRGPAlEYZFbukqt15djD6pRihaA4=
Received: from CH0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:610:11a::6)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 06:50:28 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::d) by CH0PR03CA0357.outlook.office365.com
 (2603:10b6:610:11a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 06:50:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:28 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:12 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:50:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:50:12 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI423626771;
	Tue, 22 Sep 2026 01:50:08 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 10/19] dmaengine: ti: k3-udma: refactor resource setup functions
Date: Tue, 22 Sep 2026 12:17:34 +0530
Message-ID: <20260922064902.2719979-11-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: d29262f9-9365-4172-b6fe-08df1875c9a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|23010399003|36860700016|921020|3023799007|6133799003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5wCB1UuZzzV5HiVBA4w4wCoIfdDrhxrwr/SILW3zEiWhKrhOlKdsPj/6pThgxrB8z9ZhxWl8ECLvxBgN83aC4gryqibn8cvXuJSTd5tOBMR36NGtxfatSYVTJKOn3kPVXSKMl+wbldwx/NqFkasfxTGG5UD4svW7gMkJ/v5OmHD75+D2WeHcf7xYh+70dcMto1GiVf+vb642vdHw4plvlL+C3TYMC9SrjiMExKaz23B2GvWSZbcCoNbpwTILrrWE6gLEuGTvMORN5M6j4KSgRT0D6MD0nFVIEqa4zcKburRQScuSRIzvKKcLNiU52Epev2iFsjF1NppDndorrYxJ9/1Kb+/035ydnvEaGFpjhn/hy3nWNh7E/EpIk9nYeve/sCNwnxnWOTq4w8xAZ0ur16ehgOpXJzzi/q1NoVLrKcuRfvWbhNy+v7hYVMTtWWz6NbuOGl0Cj3AhFvYE1b9rUMbEZ1eP7GlSdfdHZ+pM09PuDrQCdpHhMCtUBEPPCKSoysEAmCnFzLPzo6RiRF25HTFNE1TtmIxU8EKKoDInufLxT5vaOsR+mzmcxqBV3IOBctmE6hQ1rdEyHLLej1GWiRxXfeTS9R1GrjSdQAiPeYy1UaaopIZJAIO+GnoYnTxZfdFDRTF3zW2Oulhtebn3ye6OYhWshjQqE8LJHd7od2xGBoY94YSIHnJlFKjpOFxXkmM918g+udW3vof/C6FVoV12gW6fN1P21Chs4Sq2dIeWpv+bJjlq5zxesWP0H0Ku
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(23010399003)(36860700016)(921020)(3023799007)(6133799003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1srikFV2YXzNpmmDkFhoH8MDrNjVyIJjGLY+GxiUuvq271MjTn49bj7D4NGvfnZBCF7DGZG2H6ajOV1FLymrzxMK4YHQXP8Q8l8Z+Q8vEkmMtZEfJgHN4R1W2pr9XIljJ0Khs7Hp5j4xqJ2A+5qkiH81t9Mea55gLT3BAhYvFn7/WlPf+10vjjF6bcoe1ilPvTrjeQtdWQN6oYh48ADp3FQlWt/bCfspx3TFXIEho8UvMrBzQPEjhtVr4sELMK3xkMcHujsr0FAWETJqj1Q/ozIAVroIhHcwSdQaIDQR5oG5QW/UinbRG16Gmc9RqPqPMu7l8UrQkLnckhZX0N19O4wcAJnfc22LIE/EWDrXVGMzejun4/siAlGGqC6JtvZvAMpM3XL1KGLWlIAo0pa9NSSP344PjjuzQIbEGQMKmwP9uDkkPjWaeaMqlVFZdlza
X-Exchange-RoutingPolicyChecked:
	OMadkfXAkKZGnTIWi7DhlB/H5HKbXg3Ekv/9iB5h1B/TgmyAMCmp9byT+6kedYeNer96UfifUC8rKVNb4Q3Ks0/y9g/omO3TwgpnvPemYGSb4hUGHQcjIY7jlCEzVhyGH9Or61zNEldhuRg2xWLdAMvuiwnRskn8sRQAIV/gGbi4POaVgCtt7lK1fz0ImMGZXb0RawaG1v9/natYDTQD1QOJ4JyrKQvSKOYtiL3yMKDcekZRM32jg4JZh4glnBfChtdkLJ7FO2S1HinW9wbXoXm688quHf/cgfWBWykP27GLvwD6/JEzmiIeTIV9oT2jpBwu6PHtbv77kiVZBkLSqQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:28.2203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29262f9-9365-4172-b6fe-08df1875c9a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-Proofpoint-ORIG-GUID: oS0OU3AQv93PNE3MR3jsDIh7QxY0lhmD
X-Proofpoint-GUID: oS0OU3AQv93PNE3MR3jsDIh7QxY0lhmD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXxRZn80/rLM6h
 fG1/voVR8Er66TKEMmLC/fitxP6lttBLX2wkeSuhsSdhbR71dgMecf3HFgcrw7nVShlBrrDjKHo
 u3Btu/1GzfSgO0X3+cH1pJQy1A84pBF5I8m/h42z9x9lYM57BECAGHtI6QaCma1VXayPUfIkYeN
 DyzT7YzyS9PsRspxPrOd3Hw3VSyGHyWZFOZfeJTjeEJpJ1XryyLhHJaCATFRbYlgjR0v4Xnz3FU
 er9sddM/oXvlx9ZSbtqP+lvRUxCRrIicU2OJssAfXQq/dHU5oaFCr0cTsZcgzWVx75lR7PUG9I3
 eKroHDqhvry74C201LF2uQziJoDes9BYFgMySkAcLiQwC/Vb8Fgg015yxJhmATyje/yQGrP22oW
 OlU8VxDopVQkN+vxaKxvN64ybNpPzyVdf3vLn7TDN0CgXLjX2sqXchzZKI4vxsguDZ3b6VEXfkF
 C+E8eVKB74pN8RWO/bA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfXxo4KLJA8tjjx
 jmoEVxEuNb418bh/58dVwkIPE57WLHtFUO24oNs+rG1KlshKtCHfmUa/Mvson+RryFt9jdGd856
 H3oRJLiosfDSx1g8/0QkZpU4CJkd5/o=
X-Authority-Analysis: v=2.4 cv=INeXmQvG c=1 sm=1 tr=0 ts=6ab22539 cx=c_pps
 a=bbY6CEmM+CWjO+hqT4zsvA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=I_B2hWj7ayHADsQg9NcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

The implementation of setup_resources, bcdma_setup_resources and
pktdma_setup_resources is largely shared between all K3 UDMA variants
with the only major difference being SCI resources setup. So,
- Move the functions to k3-udma-common.c.
- Split SCI resource setup for bcdma and pktdma into separate functions
  in variant specific driver (k3-udma.c).
- Add function pointers for setup_sci_resources in udma_dev and call
  them as part of the actual resource setup implementations in
  k3-udma-common.c to retain the existing functionality.
- Also since setup_resources call udma_setup_resources which is not
  required for all K3 UDMA variants, Add a function pointer in udma_dev
  and use that to call udma_setup_resources.
- Rename setup_resources to k3_udma_setup_resources to avoid polluting
  global kernel namespace with generic symbol.

This refactor improves code reuse and maintainability across multiple
variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 200 ++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 184 ++---------------------------
 drivers/dma/ti/k3-udma.h        |   6 +
 3 files changed, 213 insertions(+), 177 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 34f8eab9ddb57..d0afbab01786f 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -8,7 +8,9 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/soc/ti/ti_sci_inta_msi.h>
 #include <linux/soc/ti/k3-ringacc.h>
 
 #include "k3-udma.h"
@@ -2334,5 +2336,203 @@ void bcdma_free_bchan_resources(struct udma_chan *uc)
 }
 EXPORT_SYMBOL_GPL(bcdma_free_bchan_resources);
 
+static int bcdma_setup_resources(struct udma_dev *ud)
+{
+	int ret;
+	struct device *dev = ud->dev;
+	u32 cap;
+
+	/* Set up the throughput level start indexes */
+	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
+	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
+		ud->bchan_tpl.levels = 3;
+		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
+		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
+	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
+		ud->bchan_tpl.levels = 2;
+		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
+	} else {
+		ud->bchan_tpl.levels = 1;
+	}
+
+	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
+	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
+		ud->rchan_tpl.levels = 3;
+		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
+		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
+	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
+		ud->rchan_tpl.levels = 2;
+		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
+	} else {
+		ud->rchan_tpl.levels = 1;
+	}
+
+	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
+		ud->tchan_tpl.levels = 3;
+		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
+		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
+	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
+		ud->tchan_tpl.levels = 2;
+		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
+	} else {
+		ud->tchan_tpl.levels = 1;
+	}
+
+	ud->bchan_map = devm_bitmap_zalloc(dev, ud->bchan_cnt, GFP_KERNEL);
+	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
+				  GFP_KERNEL);
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	/* BCDMA do not really have flows, but the driver expect it */
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+
+	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
+	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
+	    !ud->rflows)
+		return -ENOMEM;
+
+	if (ud->bcdma_setup_sci_resources) {
+		ret = ud->bcdma_setup_sci_resources(ud);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int pktdma_setup_resources(struct udma_dev *ud)
+{
+	int ret;
+	struct device *dev = ud->dev;
+	u32 cap3;
+
+	/* Set up the throughput level start indexes */
+	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
+	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
+		ud->tchan_tpl.levels = 3;
+		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
+		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
+	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
+		ud->tchan_tpl.levels = 2;
+		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
+	} else {
+		ud->tchan_tpl.levels = 1;
+	}
+
+	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
+	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
+	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
+
+	ud->tchan_map = devm_bitmap_zalloc(dev, ud->tchan_cnt, GFP_KERNEL);
+	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
+				  GFP_KERNEL);
+	ud->rchan_map = devm_bitmap_zalloc(dev, ud->rchan_cnt, GFP_KERNEL);
+	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
+				  GFP_KERNEL);
+	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
+					sizeof(unsigned long),
+					GFP_KERNEL);
+	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
+				  GFP_KERNEL);
+	ud->tflow_map = devm_bitmap_zalloc(dev, ud->tflow_cnt, GFP_KERNEL);
+
+	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
+	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
+		return -ENOMEM;
+
+	if (ud->pktdma_setup_sci_resources) {
+		ret = ud->pktdma_setup_sci_resources(ud);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+int k3_udma_setup_resources(struct udma_dev *ud)
+{
+	struct device *dev = ud->dev;
+	int ch_count, ret;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
+		if (!ud->udma_setup_resources)
+			return -EINVAL;
+		ret = ud->udma_setup_resources(ud);
+		break;
+	case DMA_TYPE_BCDMA:
+		ret = bcdma_setup_resources(ud);
+		break;
+	case DMA_TYPE_PKTDMA:
+		ret = pktdma_setup_resources(ud);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret)
+		return ret;
+
+	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
+	if (ud->bchan_cnt)
+		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
+	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
+	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
+	if (!ch_count)
+		return -ENODEV;
+
+	ud->channels = devm_kcalloc(dev, ch_count, sizeof(*ud->channels),
+				    GFP_KERNEL);
+	if (!ud->channels)
+		return -ENOMEM;
+
+	switch (ud->match_data->type) {
+	case DMA_TYPE_UDMA:
+		dev_info(dev,
+			 "Channels: %d (tchan: %u, rchan: %u, gp-rflow: %u)\n",
+			 ch_count,
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt),
+			 ud->rflow_cnt - bitmap_weight(ud->rflow_gp_map,
+						       ud->rflow_cnt));
+		break;
+	case DMA_TYPE_BCDMA:
+		dev_info(dev,
+			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
+			 ch_count,
+			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
+						       ud->bchan_cnt),
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt));
+		break;
+	case DMA_TYPE_PKTDMA:
+		dev_info(dev,
+			 "Channels: %d (tchan: %u, rchan: %u)\n",
+			 ch_count,
+			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+						       ud->tchan_cnt),
+			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+						       ud->rchan_cnt));
+		break;
+	default:
+		break;
+	}
+
+	return ch_count;
+}
+EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 21978f17e327f..9a261747c8709 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2083,7 +2083,7 @@ static const char * const range_names[] = {
 	[RM_RANGE_TFLOW] = "ti,sci-rm-range-tflow",
 };
 
-static int udma_setup_resources(struct udma_dev *ud)
+int udma_setup_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
@@ -2245,74 +2245,13 @@ static int udma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int bcdma_setup_resources(struct udma_dev *ud)
+static int bcdma_setup_sci_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
 	struct ti_sci_resource *rm_res, irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
-	u32 cap;
-
-	/* Set up the throughput level start indexes */
-	cap = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
-	if (BCDMA_CAP3_UBCHAN_CNT(cap)) {
-		ud->bchan_tpl.levels = 3;
-		ud->bchan_tpl.start_idx[1] = BCDMA_CAP3_UBCHAN_CNT(cap);
-		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
-	} else if (BCDMA_CAP3_HBCHAN_CNT(cap)) {
-		ud->bchan_tpl.levels = 2;
-		ud->bchan_tpl.start_idx[0] = BCDMA_CAP3_HBCHAN_CNT(cap);
-	} else {
-		ud->bchan_tpl.levels = 1;
-	}
-
-	cap = udma_read(ud->mmrs[MMR_GCFG], 0x30);
-	if (BCDMA_CAP4_URCHAN_CNT(cap)) {
-		ud->rchan_tpl.levels = 3;
-		ud->rchan_tpl.start_idx[1] = BCDMA_CAP4_URCHAN_CNT(cap);
-		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
-	} else if (BCDMA_CAP4_HRCHAN_CNT(cap)) {
-		ud->rchan_tpl.levels = 2;
-		ud->rchan_tpl.start_idx[0] = BCDMA_CAP4_HRCHAN_CNT(cap);
-	} else {
-		ud->rchan_tpl.levels = 1;
-	}
-
-	if (BCDMA_CAP4_UTCHAN_CNT(cap)) {
-		ud->tchan_tpl.levels = 3;
-		ud->tchan_tpl.start_idx[1] = BCDMA_CAP4_UTCHAN_CNT(cap);
-		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
-	} else if (BCDMA_CAP4_HTCHAN_CNT(cap)) {
-		ud->tchan_tpl.levels = 2;
-		ud->tchan_tpl.start_idx[0] = BCDMA_CAP4_HTCHAN_CNT(cap);
-	} else {
-		ud->tchan_tpl.levels = 1;
-	}
-
-	ud->bchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->bchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->bchans = devm_kcalloc(dev, ud->bchan_cnt, sizeof(*ud->bchans),
-				  GFP_KERNEL);
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
-				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
-	/* BCDMA do not really have flows, but the driver expect it */
-	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					sizeof(unsigned long),
-					GFP_KERNEL);
-	ud->rflows = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rflows),
-				  GFP_KERNEL);
-
-	if (!ud->bchan_map || !ud->tchan_map || !ud->rchan_map ||
-	    !ud->rflow_in_use || !ud->bchans || !ud->tchans || !ud->rchans ||
-	    !ud->rflows)
-		return -ENOMEM;
 
 	/* Get resource ranges from tisci */
 	for (i = 0; i < RM_RANGE_LAST; i++) {
@@ -2476,51 +2415,13 @@ static int bcdma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int pktdma_setup_resources(struct udma_dev *ud)
+static int pktdma_setup_sci_resources(struct udma_dev *ud)
 {
 	int ret, i, j;
 	struct device *dev = ud->dev;
 	struct ti_sci_resource *rm_res, irq_res;
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 	const struct udma_oes_offsets *oes = &ud->soc_data->oes;
-	u32 cap3;
-
-	/* Set up the throughput level start indexes */
-	cap3 = udma_read(ud->mmrs[MMR_GCFG], 0x2c);
-	if (UDMA_CAP3_UCHAN_CNT(cap3)) {
-		ud->tchan_tpl.levels = 3;
-		ud->tchan_tpl.start_idx[1] = UDMA_CAP3_UCHAN_CNT(cap3);
-		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-	} else if (UDMA_CAP3_HCHAN_CNT(cap3)) {
-		ud->tchan_tpl.levels = 2;
-		ud->tchan_tpl.start_idx[0] = UDMA_CAP3_HCHAN_CNT(cap3);
-	} else {
-		ud->tchan_tpl.levels = 1;
-	}
-
-	ud->rchan_tpl.levels = ud->tchan_tpl.levels;
-	ud->rchan_tpl.start_idx[0] = ud->tchan_tpl.start_idx[0];
-	ud->rchan_tpl.start_idx[1] = ud->tchan_tpl.start_idx[1];
-
-	ud->tchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->tchans = devm_kcalloc(dev, ud->tchan_cnt, sizeof(*ud->tchans),
-				  GFP_KERNEL);
-	ud->rchan_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->rchan_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-	ud->rchans = devm_kcalloc(dev, ud->rchan_cnt, sizeof(*ud->rchans),
-				  GFP_KERNEL);
-	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rflow_cnt),
-					sizeof(unsigned long),
-					GFP_KERNEL);
-	ud->rflows = devm_kcalloc(dev, ud->rflow_cnt, sizeof(*ud->rflows),
-				  GFP_KERNEL);
-	ud->tflow_map = devm_kmalloc_array(dev, BITS_TO_LONGS(ud->tflow_cnt),
-					   sizeof(unsigned long), GFP_KERNEL);
-
-	if (!ud->tchan_map || !ud->rchan_map || !ud->tflow_map || !ud->tchans ||
-	    !ud->rchans || !ud->rflows || !ud->rflow_in_use)
-		return -ENOMEM;
 
 	/* Get resource ranges from tisci */
 	for (i = 0; i < RM_RANGE_LAST; i++) {
@@ -2631,80 +2532,6 @@ static int pktdma_setup_resources(struct udma_dev *ud)
 	return 0;
 }
 
-static int setup_resources(struct udma_dev *ud)
-{
-	struct device *dev = ud->dev;
-	int ch_count, ret;
-
-	switch (ud->match_data->type) {
-	case DMA_TYPE_UDMA:
-		ret = udma_setup_resources(ud);
-		break;
-	case DMA_TYPE_BCDMA:
-		ret = bcdma_setup_resources(ud);
-		break;
-	case DMA_TYPE_PKTDMA:
-		ret = pktdma_setup_resources(ud);
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	if (ret)
-		return ret;
-
-	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
-	if (ud->bchan_cnt)
-		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
-	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
-	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
-	if (!ch_count)
-		return -ENODEV;
-
-	ud->channels = devm_kcalloc(dev, ch_count, sizeof(*ud->channels),
-				    GFP_KERNEL);
-	if (!ud->channels)
-		return -ENOMEM;
-
-	switch (ud->match_data->type) {
-	case DMA_TYPE_UDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u, gp-rflow: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt),
-			 ud->rflow_cnt - bitmap_weight(ud->rflow_gp_map,
-						       ud->rflow_cnt));
-		break;
-	case DMA_TYPE_BCDMA:
-		dev_info(dev,
-			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
-						       ud->bchan_cnt),
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
-		break;
-	case DMA_TYPE_PKTDMA:
-		dev_info(dev,
-			 "Channels: %d (tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
-		break;
-	default:
-		break;
-	}
-
-	return ch_count;
-}
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
@@ -2747,6 +2574,9 @@ static int udma_probe(struct platform_device *pdev)
 	ud->decrement_byte_counters = udma_decrement_byte_counters;
 	ud->psil_pair = navss_psil_pair;
 	ud->psil_unpair = navss_psil_unpair;
+	ud->udma_setup_resources = udma_setup_resources;
+	ud->bcdma_setup_sci_resources = bcdma_setup_sci_resources;
+	ud->pktdma_setup_sci_resources = pktdma_setup_sci_resources;
 
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
@@ -2876,7 +2706,7 @@ static int udma_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&ud->ddev.channels);
 	INIT_LIST_HEAD(&ud->desc_to_purge);
 
-	ch_count = setup_resources(ud);
+	ch_count = k3_udma_setup_resources(ud);
 	if (ch_count <= 0)
 		return ch_count;
 
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 329df7eb156b2..d64b670d42490 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -357,6 +357,9 @@ struct udma_dev {
 			 u32 dst_thread);
 	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
 			   u32 dst_thread);
+	int (*udma_setup_resources)(struct udma_dev *ud);
+	int (*bcdma_setup_sci_resources)(struct udma_dev *ud);
+	int (*pktdma_setup_sci_resources)(struct udma_dev *ud);
 };
 
 struct udma_desc {
@@ -679,6 +682,9 @@ struct udma_bchan *__udma_reserve_bchan(struct udma_dev *ud, enum udma_tp_level
 struct udma_tchan *__udma_reserve_tchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 struct udma_rchan *__udma_reserve_rchan(struct udma_dev *ud, enum udma_tp_level tpl, int id);
 
+int udma_setup_resources(struct udma_dev *ud);
+int k3_udma_setup_resources(struct udma_dev *ud);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

