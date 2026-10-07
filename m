Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494D472782;
	Wed,  7 Oct 2026 10:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369070; cv=fail; b=ffEpH4MYOzl9mAYcdcwNUHGPB5FXqbdbispl7aYL4SUIKrcJ9Cg32b40UQeXdRUXBIH3BJMljlJI0B9hV+wujg/ltTDt+NKaJyDkUTpYJUOmkk431b54qErbwrhpQj4X4t9J5su0bRLjZZMfF2MGpRJP0WEKoxz7pdBA4NGoeaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369070; c=relaxed/simple;
	bh=184XBk46sUH8I1pwKQnQWvCPpOdlQOGR/Ko6EKOF1c8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F6cT8SFAVug7HLqtSmtoIVaVvddm3ZkDHIRIuKERIu/n3k9NgrsMKvkJARu9QlVYDw75EceJZb/N+duODCn1kFDOC8GusGAz/xM5tPPfMQfiWwK4XI0widC5HcqGCANbwnElP7RUYYOg8Gfk5zuC/DDejYLCdJ0DNT5NsO8fXxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ZVYvG4rM; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=BcsIKYCj; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ZVYvG4rM";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="BcsIKYCj"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6977jnTC494547;
	Wed, 7 Oct 2026 05:30:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=4ruMivt2/Z+T5vkEvU9zpaCWU+Wqd4HECDEtUJX22
	bo=; b=ZVYvG4rMZL9LGO/+lm/d50PL5Jyc8rdHjD+Leh8VgKvZYYPaeYBnPCR45
	hXt55HgUny4QvkUfZHGLS5cqtRoOUgwkqV1353DoDEC3AUVSV7648gDdm/R/CLit
	EqhHglEPfWzT05imfwR15JBlt8p0MZdZNLmDIy7Ng+zvfbKQjRS+p1Q5z07fIice
	XqIx6f++/VrvJIC4mduILsgZkuuDFuJ4estw1nA7UUKOrrnPBMJV2c2iaBE5x9SI
	JR6xguOZUUUplRnKVCzL23UBdkqLHZgQluOy0ncPEMdbSFuOPKiPlJamTLkYK9xG
	oN/wfOs+BojN/ZPt2ZURB9ayayIog==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011023.outbound.protection.outlook.com [52.101.57.23])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h5dk4swyu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bOWQEqtIB5oD71X5CNjAWhRBkC0k9Ha8IA1dEdseJMVXmO0ETxDvDR+CRee2ntEMWqVOZeD0u7iHIDrtZIEsJrB1YHvuXNKYwVXuxHX59gD7oOxqmCfZSbN64Idx9OS+HrARaHqPxI2uJtLHQ7wF0oqpdruVrJjpIuox+gkgpZ6FYD1B+MwR8sdHUOeDQNheNlBUS/mAbV9N7wPOIwngQCjCnHRmaTzVuVSJLjJrJjE77zWGmUaL5pEsp4pw2+4KzNh66hBqjZ1qtaTFW4A9J91ZU/u5zaC0ZpKQZ/wv8XFglTL1G88SJD8uBdZTnhKKsE9xMz2kjuCupmBWwe1iEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ruMivt2/Z+T5vkEvU9zpaCWU+Wqd4HECDEtUJX22bo=;
 b=Of+0hMWxtwVJSQHa1s4UYnL1o5DYAM6If8OLV1WVuNVSFymVU1HO4+necvmjTyEgqXB3yW46qRINbTUERNekSwWlVsRd4fsKHrII/dtynFt8bf0Pn2b0GBqN2FGxAX0DCgL3je94w//f4s2Z4hPuPj//hTrlS7coEwRmBNgHwG30spgoIduuhJHnTRiSoXcxrU9NkqvrbAKcKjPdXtRQQaEDmn05RDSojNV2k/YWgG7lbBZYvPCykOg2Q5jm9ffXNkIuBj73imJ2c5RuYo+jVtXyLzsR81nbLq8yySC+gielTqxpBDjdUcfFruI9DtgoRLZa98tZE3S0pA0tw0FpLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ruMivt2/Z+T5vkEvU9zpaCWU+Wqd4HECDEtUJX22bo=;
 b=BcsIKYCjg1TR6tKr3p0Y76WugolDFepSx2IUvAbTHbkzhByvB1j5+ud5/NsYH7nJW4K8PvC1XikS0LhT0lRFzaNgv5+rcq//SDgcDXrQbtnVmJe6p9+rQZkkjKbIs6OZWU09CdEAa+iq672rG+/MWd63g9YvTXQX2fx45tZfF0Y=
Received: from CY5PR15CA0250.namprd15.prod.outlook.com (2603:10b6:930:66::24)
 by CY8PR10MB6778.namprd10.prod.outlook.com (2603:10b6:930:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Wed, 7 Oct
 2026 10:30:37 +0000
Received: from CY8PEPF00000053.namprd05.prod.outlook.com
 (2603:10b6:930:66:cafe::2d) by CY5PR15CA0250.outlook.office365.com
 (2603:10b6:930:66::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:30:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000053.mail.protection.outlook.com (10.167.247.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:30:37 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:22 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:30:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:30:22 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSp013473;
	Wed, 7 Oct 2026 05:30:18 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 07/20] dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev
Date: Wed, 7 Oct 2026 15:58:48 +0530
Message-ID: <20261007102936.2402427-8-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007102936.2402427-1-s-adivi@ti.com>
References: <20261007102936.2402427-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000053:EE_|CY8PR10MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f91225-9d5b-4047-7e8b-08df245e071e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|7416014|36860700016|23010399003|18002099003|22082099003|6133799003|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	GoPHmd2xpO24dyQGKCer/+Mx5axbfpAXMOA6RliZDKFopvCoU/6Y6df/4kQ1a2WNEoTSaCbJl4CorI9E8SkfAdkM1F9qfEhg+5ZJrKxyBB+TvsuXvK/WitarThFSjmnsKd7STLjye2li7haiciGVE9rQaNsphasYpvXEsfYzXfzT8coAGLr1N0cL0UgcnEBV/thVSkIk0qZ/7bVRR92KU2LdCsDcY6f+JjQDR0UAqxz1J8qAcADctQpqb/b2zO631xdSlcPf6g53YX165Z5pcuu7oQ7Trg8IFDyg625zVtf+3J78skYWbygUrH1xojOSqXWrCnm8NPKPw83EG2127v9XKYN2KnCXyx1ysIz9EV2MsVf9NZt7botGXKAy/JQ1/I396nHGlx/vH2dafpYK6tQsDJUMfBGBmmWGoIO1rdDPe23r6xnspyhBysk5LL3pIKYSyZAiQ/6Rkcs4/hvBoum+4jgUYZ6lrX3yK5gXRGAsdJIHdzODno31Qwd1vGxX4wjq0y9COK4Gzv96o4bfpHYA2JrGDAzo3xSOB3PBP/IunaEdw7U9J8Rvvb+dlE2ERtpYVUZoefWVBUwNrK+T/vDpjVM1l1fslfT2R01c9RPJ4RBwjLqOZr6aXZ3DivyMmyCAk5t40rOXmBbFUcZ/kfRzxLKNpzfeSNWT6EHtwiYxFxLdFzPgNsXlk9QZFpYh4YIa2TybReXiY4mmVVZlTkJMB60w8fZLXoMPx5JMVACTwJcSVVjRoro+DQNLV+tB
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UambtPG6hCWafPdguW6lsTVbMNHs+/RV+joBKTIxXi2ZAhfk8Enkj5phLo3lT90TTt0SBXfU+vFGFpULNR+KlCbXDrnZVLEoB9EExe9Vfsa3ucjjfO4GXOoNfzikY2DMyNeluIfSYJVsfDG6PDOkqC434d2M03HLn8qZpmkC7CHBMaWbhsS5OxFBeN9UPrKMI2xk3gabs4Hs8XdpZu4KdbuSYiduSf/SFeOdlrospFUrSwhvQTHjeDjiB4xy3SPXDJ/a0RW+KnCBNzFhLEPQVD/r0h1q9IlKurVb7alqiBRWfLH738w0HTp7whXo8v6iCb9eECJK8POmihKz01q3qU8fr2YjaQL8RN5mkNQiUD+OdTHBqI2k/ZyHTa40/MggCL8HLmL/dfw0vX6FJmp87Ri3wXr4kv5Rh8r2tcSUvNRrd2ChBKrsJtDupe19JPDk
X-Exchange-RoutingPolicyChecked:
	kyQFzN3+ZEWUZ3YY0tdoUGl523AttuRWOcgpPxx9fYQMVHxqfy9M7qey8+IkhADSpI2pq8f18GCtOaViwGZ4tlRHPSdbKnIeJ7GIRbDT5W5fn729B2E0JYml8PUeXkfVYD2fb96oauTRGaM7ZahP9kBaxZsvKMwKNAueUVOVU4MQqCAS8XQ3P0mC9KVymbQVk0zP901CPQuN2twQ/HGAlKWxPJAd3UCPMjOfK5ksXDwk/Iz8yZM9neRUEDazbRc7AtpqbQujQKfvX8QUqHRg8TFmfCtg8v/7BwyYDOMS3ib22l3SvX5BYoEnfYB6eMfl93Z3H+Khtydsfc2Uyyverg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:30:37.4051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f91225-9d5b-4047-7e8b-08df245e071e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000053.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6778
X-Authority-Analysis: v=2.4 cv=TaYDJhQh c=1 sm=1 tr=0 ts=6ac61f51 cx=c_pps
 a=n8CZQ1v8Y1OZ9xNCwzzv5Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8
 a=G_UKfOQgHLmTBcQ1_a4A:9 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: ODGK_fAPOp9bJEjs7afQEMBvmHJqv6jm
X-Proofpoint-ORIG-GUID: ODGK_fAPOp9bJEjs7afQEMBvmHJqv6jm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX97VoGYtvWmz6
 BD31Ey4+6oaOGvzM7ZzldZAUh9yzNHHOczNM1+BACWQ9LysNcBPt9DLWTORhDIjOQM1L8HsEj7p
 c82CtOGB/DWfkRRx5H4yq54mSA5nLLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX6ISEwqRF4brf
 vvyj43nHv+eVt3hZhLkgznnaGZKO/wXEyKtTW1RcgiS80dmnOXvdxwfymrlQ1jjflT08XKCUxBj
 uX+da3vG10jgiipF10orLQ+knurTiypQE03p81ekZv+raOuCPwcIM8KJb7JGxalSEPVxVg1mUmQ
 pqoX4gYxzD1ihs7kdFEXupsSQCEjQJqYGt4j4b3QbjfNZFkpzrlJedeCd8OSCFn+cl+GVu+n33j
 Gd9Zu9e7s4Airu+wOup3afrrfcxOkX8MDlFydbiqcH2ZV9LzRx/uR6EsPpJIzdR/TP9wNW/Sjxp
 RPyN0gDloSlMwdjBKoGQw23b8Q+DoiMwDssK99579PPk9d+H7bj3C1vElDGqr8o7g5bIUrtOq+J
 bJ/KnhlNwttQOfSM/dReShqGozP8IBxIOdzoEU9aiNds6YmgYk3PAmv23jNku+34ftqWJDFc5AF
 hJjAIYIwhQErXmET7kg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations.
This prepares the driver for supporting multiple K3 UDMA variants,
such as UDMA v2, with minimal code duplication.

No functional changes intended in this commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-private.c | 10 ++++-
 drivers/dma/ti/k3-udma.c         | 66 ++++++++++++++++++--------------
 drivers/dma/ti/k3-udma.h         | 12 ++++++
 3 files changed, 57 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 624360423ef17..44c097fff5ee6 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -8,13 +8,19 @@
 
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_pair(ud, src_thread, dst_thread);
+	if (ud->psil_pair)
+		return ud->psil_pair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_pair);
 
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_unpair(ud, src_thread, dst_thread);
+	if (ud->psil_unpair)
+		return ud->psil_unpair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_unpair);
 
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 6a731fcfc0697..36dcc888815ea 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,7 +40,7 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -50,8 +50,8 @@ static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 					      src_thread, dst_thread);
 }
 
-static int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-			     u32 dst_thread)
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
+		      u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -329,7 +329,7 @@ static int udma_start(struct udma_chan *uc)
 	}
 
 	/* Make sure that we clear the teardown bit, if it is set */
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 
 	/* Push descriptors before we start the channel */
 	udma_start_desc(uc);
@@ -521,8 +521,8 @@ static void udma_check_tx_completion(struct work_struct *work)
 		if (uc->desc) {
 			struct udma_desc *d = uc->desc;
 
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 			break;
 		}
@@ -554,7 +554,7 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 		}
 
 		if (!uc->desc)
-			udma_start(uc);
+			uc->ud->start(uc);
 
 		goto out;
 	}
@@ -576,8 +576,8 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 				vchan_cyclic_callback(&d->vd);
 			} else {
 				if (udma_is_desc_really_done(uc, d)) {
-					udma_decrement_byte_counters(uc, d->residue);
-					udma_start(uc);
+					uc->ud->decrement_byte_counters(uc, d->residue);
+					uc->ud->start(uc);
 					vchan_cookie_complete(&d->vd);
 				} else {
 					schedule_delayed_work(&uc->tx_drain.work,
@@ -612,8 +612,8 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else {
 			/* TODO: figure out the real amount of data */
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 		}
 	}
@@ -1654,7 +1654,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1663,7 +1663,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -1718,7 +1718,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_ring = 0;
 	uc->irq_num_udma = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -1821,7 +1821,7 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1849,8 +1849,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 		uc->use_dma_pool = true;
 	} else if (uc->config.dir != DMA_MEM_TO_MEM) {
 		/* PSI-L pairing */
-		ret = navss_psil_pair(ud, uc->config.src_thread,
-				      uc->config.dst_thread);
+		ret = ud->psil_pair(ud, uc->config.src_thread,
+				    uc->config.dst_thread);
 		if (ret) {
 			dev_err(ud->dev,
 				"PSI-L pairing failed: 0x%04x -> 0x%04x\n",
@@ -1910,8 +1910,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_udma = 0;
 err_psi_free:
 	if (uc->psil_paired)
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	bcdma_free_bchan_resources(uc);
@@ -2014,7 +2014,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -2037,7 +2037,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->use_dma_pool = true;
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -2083,7 +2083,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 err_irq_free:
 	uc->irq_num_ring = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -2123,7 +2123,7 @@ static void udma_issue_pending(struct dma_chan *chan)
 		 */
 		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
 		      udma_is_chan_running(uc)))
-			udma_start(uc);
+			uc->ud->start(uc);
 	}
 
 	spin_unlock_irqrestore(&uc->vc.lock, flags);
@@ -2265,7 +2265,7 @@ static int udma_terminate_all(struct dma_chan *chan)
 	spin_lock_irqsave(&uc->vc.lock, flags);
 
 	if (udma_is_chan_running(uc))
-		udma_stop(uc);
+		uc->ud->stop(uc);
 
 	if (uc->desc) {
 		uc->terminated_desc = uc->desc;
@@ -2297,11 +2297,11 @@ static void udma_synchronize(struct dma_chan *chan)
 			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
 				 uc->id);
 			udma_dump_chan_stdata(uc);
-			udma_reset_chan(uc, true);
+			uc->ud->reset_chan(uc, true);
 		}
 	}
 
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 	if (udma_is_chan_running(uc))
 		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
 
@@ -2355,7 +2355,7 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	udma_terminate_all(chan);
 	if (uc->terminated_desc) {
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		udma_reset_rings(uc);
 	}
 
@@ -2374,8 +2374,8 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	/* Release PSI-L pairing */
 	if (uc->psil_paired) {
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 		uc->psil_paired = false;
 	}
 
@@ -3694,6 +3694,14 @@ static int udma_probe(struct platform_device *pdev)
 		ud->soc_data = soc->data;
 	}
 
+	// Setup function pointers
+	ud->start = udma_start;
+	ud->stop = udma_stop;
+	ud->reset_chan = udma_reset_chan;
+	ud->decrement_byte_counters = udma_decrement_byte_counters;
+	ud->psil_pair = navss_psil_pair;
+	ud->psil_unpair = navss_psil_unpair;
+
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
 		return ret;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 1777f0e1f085e..59170714f53cc 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -349,6 +349,15 @@ struct udma_dev {
 	u32 psil_base;
 	u32 atype;
 	u32 asel;
+
+	int (*start)(struct udma_chan *uc);
+	int (*stop)(struct udma_chan *uc);
+	int (*reset_chan)(struct udma_chan *uc, bool hard);
+	void (*decrement_byte_counters)(struct udma_chan *uc, u32 val);
+	int (*psil_pair)(struct udma_dev *ud, u32 src_thread,
+			 u32 dst_thread);
+	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
+			   u32 dst_thread);
 };
 
 struct udma_desc {
@@ -586,6 +595,9 @@ int udma_push_to_ring(struct udma_chan *uc, int idx);
 int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
 void udma_reset_rings(struct udma_chan *uc);
 
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.55.0

