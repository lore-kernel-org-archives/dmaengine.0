Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEB74A6CDC;
	Thu,  1 Oct 2026 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844154; cv=fail; b=j0Bv2WVHrNKOOYhrYVbC+QC2ZsbEoUaZwPmR9DgrDg7eHqlzqNREkXstTQD4XLRzCpfgVcPEo7+Va1dc5trfmLLtr+JkWJbu802qcSRheeFqlI/6b5Dgk56rJvB/OJx+SnKR/9GhMT6uzToVmAYBmZTp0fz/BRly1pvNxGkq+FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844154; c=relaxed/simple;
	bh=6ZmeqGAms/DxeA2vVTXO6JEmYZsrr1041rI0sxNsKBo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PoF/X0euPkeFC+Kq9wGYvU6HAjbvL6v48UDKBo5VaXGE2TxQo8066qEbvew6IzqUz/KWrGK/RYetz8/wJnTVjPjPaGL6VW1fE5/7GXjtvUea2YIwcktUGYhwqQatrQFuUf68SS45eJO8TuUohn8RFYcC6vBT8NP6n38phkvLy64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bgiWEOPP; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=JupuvDLB; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bgiWEOPP";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="JupuvDLB"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691711971294630;
	Thu, 1 Oct 2026 03:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RN60cZbm8x55yvrOBDCfhRftJGt120lJ3xlg+u4Ie
	Ac=; b=bgiWEOPPoO1lKAlQuElISW60TBbnczhJSOrA2czcieX1ulkK9Nzg18Nzl
	chKQC69NQEKAkOip06nPRFE96wLpw5s/qhgMvX5SH7DlTSYucXybxf2dK9J09W8E
	biOLVJPdNUQm35pYWnp8dEwjTaAlEJ2jyPF48iaiendrJIzWrTyHvIBCHbyCNsrk
	00unEsbe8Z1YoJLOcWl5Oz58CYRurxDzPJ3kMfctSdhggYiIAyIJk6Q+JXwe4zlM
	HGRnaoaiBMWu0V9JoJnhzBM96VxOLN2PoHpBJm9eBy6Q6dcq0jmagrc90j6kyWH4
	fCyqlOWiMo5PP9Djhz9KHr3sKmDhQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012065.outbound.protection.outlook.com [40.93.195.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h1eur9prf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozWqhxMjOPByiZz7WN2Qt7ijVvadhcr2cu44e2O92wdispfkBHbBwVCRvJv/CmuCylY+tpzVkZJtHhw5yymTFETp6RjdxaeGJXdRMjIzDa+zWCHCHhny5zjNmM7lhslB5XRKLXGUApuUiaHiJMQ4FqSCP0Hop4088etsVje/01MDfJPwXMFx91fPa+Ipo/HJxqqHrWfx7WkAW2zCL/OjXQucAxXQwJ7d6oO9BAJFh//7444gIs7Wwmp0Bhfua0G4tEt91TykiAI7o20oXQcUvBeL7lI53JRaTyVY6Ot98Fk17zEanQ/h4eXHV8+kKZAI6B/o56xeUzyqBqTjrheN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RN60cZbm8x55yvrOBDCfhRftJGt120lJ3xlg+u4IeAc=;
 b=DPMH7WJsIa+dvi2JL4X/vHvC2gQAs0sPxSTqR3osJQ7SDoHKEzR7tVAZqqtKkq6npRJdaWI2O9f7UONLtzErok7GnQSHbAj9GlxZoXiOOXfzJufINP5Wm+bhXQcxcgZfHomfvH4X9nGStRUR3qaEzIXg+2xQQ5Dc/pcOAGgDHqMESugBA4QLkwUlWV5iFAV/0ohsB1q3qCqZ9GreKGSwypaztLh5Xic6u7bJecesotQSqV2f2zYYPtvBJtPZBOLiA5SXZi2hLWhSyizBZZlpvWkBsA/fUJoz63m+V5747HVVfITPPrBGOoJsh3nsquksWmEppz2PV/tU3zzePAvdEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RN60cZbm8x55yvrOBDCfhRftJGt120lJ3xlg+u4IeAc=;
 b=JupuvDLBtmedL/u37m0MRWsX7jtbNOHRsQgOBNUTJB2ne6DRGWmWDvK0t6OY7dkDASv9OxKbHgPudilHvQAjggOiM/cQ5LSaOz3sbFESZ6Tppzs+bRIEQHyuangSAem2Xb5yAAi+5iulMa8FshBmtt0Absf34fe23T7+69HE2hM=
Received: from BN9PR03CA0663.namprd03.prod.outlook.com (2603:10b6:408:10e::8)
 by DS0PR10MB997626.namprd10.prod.outlook.com (2603:10b6:8:315::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:42:09 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::9a) by BN9PR03CA0663.outlook.office365.com
 (2603:10b6:408:10e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 08:42:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:42:09 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:51 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:51 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:51 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rx630551;
	Thu, 1 Oct 2026 03:41:47 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 08/19] dmaengine: ti: k3-udma: move udma utility functions to k3-udma-common.c
Date: Thu, 1 Oct 2026 14:10:24 +0530
Message-ID: <20261001084105.1692228-9-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001084105.1692228-1-s-adivi@ti.com>
References: <20261001084105.1692228-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DS0PR10MB997626:EE_
X-MS-Office365-Filtering-Correlation-Id: b1171118-b7aa-44b1-19d9-08df1f97e16c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|23010399003|376014|36860700016|1800799024|921020|6133799003|22082099003|18002099003|56012099006|10067099003|5023799004|3023799007;
X-Microsoft-Antispam-Message-Info:
	o0LP/ZAIvt19IdcNTOpLbVZ52VtQ5CzQifwuj2vAy+Ss+PiY6Sa4R69f3ZWy45Ln7f6xzEqG/bQ9q9fxfAiIRUMOu4mDS3LK6J1bZyfKrP3FDDobp1zNPwvYsTxtKLNuV6iWv6A7GScmINdbRnzJ/2iPM51ZFduY8UMqCyIqDQTlNDcvM6dzvdGyOXOnX+lkwa2geHBE1R+tTmtCHj7zu3Qdk6xdhLg06roXiqu2y8s6Q286Y1dmUNcN5TIy277w6kVz2XWLRYDSAP23/MszzBICUQkMvlC2dwcGmPnNsVRr1E0+Moat9QaLduSl3wvsum/xCoGXiXk0+rT9zidisp14J55xhDzEnUlBTjRGTRUWJsOfafrBRV69/2RfVlAv/db8u+gIewA5JTTrZdhxsE9hJZJdz6DkoOadDtJIM3PKQ72m1Koxps1jgE8ZbBy+GsaOh4wh1LPbT6peX50lU3baxn/Tvq0NC1crNtLwxWYS8ILifyDhVteggCIOeHR1AgWFkaLTrHXkF8RgtjKw7TwCDAqqe7jQmIMBvRngHOsz7zbX8WHWhilksZCmocQ/fi0xIPj4O1kEYKpvvApQB6FsIPnCWWcrXID35XPALhgj4REyhj/TpAMjaMHYsM6+KQ3Puii7zJhE80oOouJKzOezhb4JAtwBNuPLo/f1SwWCcaGmyPaIdB1HXcQINAcQP8y90+O6vo8bYnzwECHPmQ835zj/6pJVfSUJw7RvatwAsWq9ephQtifl3rem5jYj
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(23010399003)(376014)(36860700016)(1800799024)(921020)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003)(5023799004)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hzEBJJhq1gZrD+lc6kYIE39Ufp6xwZcvbotUe0GOzjLpWPURLa20StZYHFIq0Um0zYE7A4DPxlw4j0uIHdIHwlcnQSmvZwzN74wvlAwFZ/IPyjNk41U6569c6u5QCnaauUAWvW7jA1wsg6gOktqHkeqbuSMiEdpmROayYWsqEpqv5vrM3c2w0NQrflPwIAorlMI1WBWlF7tYKbbK3hJhWh84F0eAbqdgJqu0HB1J3O3kdtr8H7B/WDIAkQ8VbuC/XgIQEskzvyhpVoKyiTw30p/RvsqOXOaPLkvuOkTMAkXVvxIyqAarEe2ZZKNVY1ULYYZtfndA/D5CB9kPV5eMa0ozqJISlrz+YGofhIOpJssqw9vQJaVBTAS/a5FHK/Koc9h3lsDdxTtaUQzqt3O/kzKurWyZOTFweKOdNz1lexHU6rEOtWGgGpS8yUnW9rXZ
X-Exchange-RoutingPolicyChecked:
	3xQKPa5e0HxFWiEsKfgKqa87OPf1t/eZdm/7/hixy3lx0fgkNl8ICkj+/4oh0MiWyn/69kqZOofr6/82kPk7ai8AsJ5x0JOHidKfs8JlGengK7OpNQy161AnYJR03KBzGgQ/vrAar6bvWjm3406MT8zCGDITT6gX/a5ynd6x1ZvwakU69alaUqTbj01doTywy/J+zNq8BeAKZvCJSHPVIvtTVp18zMjoKELFVB5eNThuTXZ5FODmKBohv7RvYYGdleXoD42FoV09fc4fDNU6CLxFp5mv7qt+N51pWqIi54tSDDZrb0vPNXD+6BZFh3GxgxiQZvU+6yRKQESpSp1+LQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:42:09.0860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1171118-b7aa-44b1-19d9-08df1f97e16c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB997626
X-Proofpoint-GUID: S-sxKcT9y1OlBf2TpZmZfCCEc-tQOa-w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXyLhU53gwPrYi
 1emfLRCSTnrnPXdyIrfr+xRYJunmkCT4Dw9DSTfg7cjM54mRcGupBFekvwKXymI+IiYhJ9hUb0A
 wxJffHEFyOeSJBXpdODzmWKvgvf4xnsiI5lh07XQDKZFwWx4fScPAAFAMecSuZPzayf9L9wHEmR
 tccSso9e+4p3y6fIsLZjjrLYZRgcKtqJzxxKBbj9aCxvesUrrVqj72RIRJdqlQnVu68ZAOcqjWU
 ORKLyUwWL6jNuEFp+5YOhecSMd1febBrU/3H70g/10+l1h3IOzOSqLd6jQor71ZEHxxL3MQHVjE
 StMCJl8u3Z3s6zOHsE0tUhQu+nCssvDvHGJuyIqTnEHkCKR11uMSUw3AmMKeDkV3ha5NIQv9APB
 UK/u7S2fwinawUj43kbaoy2g5CCe0KRcSiBElQQvps9tUZ1oKp0jaC4qKp95NnKcJTXBwi8W0Wq
 1CcxyAIbkJsfwbrMiiA==
X-Authority-Analysis: v=2.4 cv=KvzYSmWN c=1 sm=1 tr=0 ts=6abe1ce4 cx=c_pps
 a=oAmyFwY4cP9Ja8EDt9RnJg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=Z9z9lrGwI0Q7cZryMowA:9
X-Proofpoint-ORIG-GUID: S-sxKcT9y1OlBf2TpZmZfCCEc-tQOa-w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4Lfv6FzY3caO
 xd3g4BWYe+uFm0rwHMkJUZVq3uZJFSLHie8UWe/D9irYWJfrkOFhn9AUW4VijDWokl53qhzuNUC
 byImMRmEYPkFqbd/KXKLnKidik0ERjc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

Relocate udma utility functions from k3-udma.c to k3-udma-common.c file.

The implementation of these functions is largely shared between K3 UDMA
and K3 UDMA v2. This refactor improves code reuse and maintainability
across multiple variants.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 556 +++++++++++++++++++++++++++++++-
 drivers/dma/ti/k3-udma.c        | 531 ------------------------------
 drivers/dma/ti/k3-udma.h        |  31 +-
 3 files changed, 580 insertions(+), 538 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 4961f4d3d1496..86dc2933c8da7 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -4,6 +4,7 @@
  *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
  */
 
+#include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
@@ -53,6 +54,28 @@ struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
 }
 EXPORT_SYMBOL_GPL(udma_udma_desc_from_paddr);
 
+void udma_start_desc(struct udma_chan *uc)
+{
+	struct udma_chan_config *ucc = &uc->config;
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA && ucc->pkt_mode &&
+	    (uc->cyclic || ucc->dir == DMA_DEV_TO_MEM)) {
+		int i;
+
+		/*
+		 * UDMA only: Push all descriptors to ring for packet mode
+		 * cyclic or RX
+		 * PKTDMA supports pre-linked descriptor and cyclic is not
+		 * supported
+		 */
+		for (i = 0; i < uc->desc->sglen; i++)
+			udma_push_to_ring(uc, i);
+	} else {
+		udma_push_to_ring(uc, 0);
+	}
+}
+EXPORT_SYMBOL_GPL(udma_start_desc);
+
 static void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
 {
 	if (uc->use_dma_pool) {
@@ -1204,9 +1227,9 @@ udma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 }
 EXPORT_SYMBOL_GPL(udma_prep_dma_memcpy);
 
-void udma_desc_pre_callback(struct virt_dma_chan *vc,
-			    struct virt_dma_desc *vd,
-			    struct dmaengine_result *result)
+static void udma_desc_pre_callback(struct virt_dma_chan *vc,
+				   struct virt_dma_desc *vd,
+				   struct dmaengine_result *result)
 {
 	struct udma_chan *uc = to_udma_chan(&vc->chan);
 	struct udma_desc *d;
@@ -1243,7 +1266,6 @@ void udma_desc_pre_callback(struct virt_dma_chan *vc,
 		}
 	}
 }
-EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
 
 int udma_push_to_ring(struct udma_chan *uc, int idx)
 {
@@ -1348,5 +1370,531 @@ void udma_reset_rings(struct udma_chan *uc)
 }
 EXPORT_SYMBOL_GPL(udma_reset_rings);
 
+u8 udma_get_chan_tpl_index(struct udma_tpl *tpl_map, int chan_id)
+{
+	int i;
+
+	for (i = 0; i < tpl_map->levels; i++) {
+		if (chan_id >= tpl_map->start_idx[i])
+			return i;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_get_chan_tpl_index);
+
+void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel)
+{
+	struct device *chan_dev = dmaengine_chan_dev(chan);
+
+	if (asel == 0) {
+		/* No special handling for the channel */
+		chan->chan_dev->chan_dma_dev = false;
+
+		dev_clear_dma_coherent(chan_dev);
+		chan_dev->dma_parms = NULL;
+	} else if (asel == 14 || asel == 15) {
+		chan->chan_dev->chan_dma_dev = true;
+
+		dev_set_dma_coherent(chan_dev);
+		dma_coerce_mask_and_coherent(chan_dev, DMA_BIT_MASK(48));
+		chan_dev->dma_parms = chan_dev->parent->dma_parms;
+	} else {
+		dev_warn(chan->device->dev, "Invalid ASEL value: %u\n", asel);
+
+		dev_clear_dma_coherent(chan_dev);
+		chan_dev->dma_parms = NULL;
+	}
+}
+EXPORT_SYMBOL_GPL(k3_configure_chan_coherency);
+
+void udma_reset_uchan(struct udma_chan *uc)
+{
+	memset(&uc->config, 0, sizeof(uc->config));
+	uc->config.remote_thread_id = -1;
+	uc->config.mapped_channel_id = -1;
+	uc->config.default_flow_id = -1;
+	uc->state = UDMA_CHAN_IS_IDLE;
+}
+EXPORT_SYMBOL_GPL(udma_reset_uchan);
+
+void udma_dump_chan_stdata(struct udma_chan *uc)
+{
+	struct device *dev = uc->ud->dev;
+	u32 offset;
+	int i;
+
+	if (uc->config.dir == DMA_MEM_TO_DEV || uc->config.dir == DMA_MEM_TO_MEM) {
+		dev_dbg(dev, "TCHAN State data:\n");
+		for (i = 0; i < 32; i++) {
+			offset = UDMA_CHAN_RT_STDATA_REG + i * 4;
+			dev_dbg(dev, "TRT_STDATA[%02d]: 0x%08x\n", i,
+				udma_tchanrt_read(uc, offset));
+		}
+	}
+
+	if (uc->config.dir == DMA_DEV_TO_MEM || uc->config.dir == DMA_MEM_TO_MEM) {
+		dev_dbg(dev, "RCHAN State data:\n");
+		for (i = 0; i < 32; i++) {
+			offset = UDMA_CHAN_RT_STDATA_REG + i * 4;
+			dev_dbg(dev, "RRT_STDATA[%02d]: 0x%08x\n", i,
+				udma_rchanrt_read(uc, offset));
+		}
+	}
+}
+
+bool udma_is_chan_running(struct udma_chan *uc)
+{
+	u32 trt_ctl = 0;
+	u32 rrt_ctl = 0;
+
+	if (uc->tchan)
+		trt_ctl = udma_tchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
+	if (uc->rchan)
+		rrt_ctl = udma_rchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
+
+	if (trt_ctl & UDMA_CHAN_RT_CTL_EN || rrt_ctl & UDMA_CHAN_RT_CTL_EN)
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(udma_is_chan_running);
+
+bool udma_chan_needs_reconfiguration(struct udma_chan *uc)
+{
+	/* Only PDMAs have staticTR */
+	if (uc->config.ep_type == PSIL_EP_NATIVE)
+		return false;
+
+	/* Check if the staticTR configuration has changed for TX */
+	if (memcmp(&uc->static_tr, &uc->desc->static_tr, sizeof(uc->static_tr)))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(udma_chan_needs_reconfiguration);
+
+void udma_cyclic_packet_elapsed(struct udma_chan *uc)
+{
+	struct udma_desc *d = uc->desc;
+	struct cppi5_host_desc_t *h_desc;
+
+	h_desc = d->hwdesc[d->desc_idx].cppi5_desc_vaddr;
+	cppi5_hdesc_reset_to_original(h_desc);
+	udma_push_to_ring(uc, d->desc_idx);
+	d->desc_idx = (d->desc_idx + 1) % d->sglen;
+}
+EXPORT_SYMBOL_GPL(udma_cyclic_packet_elapsed);
+
+void udma_check_tx_completion(struct work_struct *work)
+{
+	struct udma_chan *uc = container_of(work, typeof(*uc),
+					    tx_drain.work.work);
+	bool desc_done = true;
+	u32 residue_diff;
+	ktime_t time_diff;
+	unsigned long delay;
+	unsigned long flags;
+
+	while (1) {
+		spin_lock_irqsave(&uc->vc.lock, flags);
+
+		if (uc->desc) {
+			/* Get previous residue and time stamp */
+			residue_diff = uc->tx_drain.residue;
+			time_diff = uc->tx_drain.tstamp;
+			/*
+			 * Get current residue and time stamp or see if
+			 * transfer is complete
+			 */
+			desc_done = udma_is_desc_really_done(uc, uc->desc);
+		}
+
+		if (!desc_done) {
+			/*
+			 * Find the time delta and residue delta w.r.t
+			 * previous poll
+			 */
+			time_diff = ktime_sub(uc->tx_drain.tstamp,
+					      time_diff) + 1;
+			residue_diff -= uc->tx_drain.residue;
+			if (residue_diff) {
+				/*
+				 * Try to guess when we should check
+				 * next time by calculating rate at
+				 * which data is being drained at the
+				 * peer device
+				 */
+				delay = (time_diff / residue_diff) *
+					uc->tx_drain.residue;
+			} else {
+				/* No progress, check again in 1 second  */
+				schedule_delayed_work(&uc->tx_drain.work, HZ);
+				break;
+			}
+
+			spin_unlock_irqrestore(&uc->vc.lock, flags);
+
+			usleep_range(ktime_to_us(delay),
+				     ktime_to_us(delay) + 10);
+			continue;
+		}
+
+		if (uc->desc) {
+			struct udma_desc *d = uc->desc;
+
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
+			vchan_cookie_complete(&d->vd);
+			break;
+		}
+
+		break;
+	}
+
+	spin_unlock_irqrestore(&uc->vc.lock, flags);
+}
+EXPORT_SYMBOL_GPL(udma_check_tx_completion);
+
+int udma_slave_config(struct dma_chan *chan,
+		      struct dma_slave_config *cfg)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+
+	memcpy(&uc->cfg, cfg, sizeof(uc->cfg));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_slave_config);
+
+void udma_issue_pending(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	unsigned long flags;
+
+	spin_lock_irqsave(&uc->vc.lock, flags);
+
+	/* If we have something pending and no active descriptor, then */
+	if (vchan_issue_pending(&uc->vc) && !uc->desc) {
+		/*
+		 * start a descriptor if the channel is NOT [marked as
+		 * terminating _and_ it is still running (teardown has not
+		 * completed yet)].
+		 */
+		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
+		      udma_is_chan_running(uc)))
+			uc->ud->start(uc);
+	}
+
+	spin_unlock_irqrestore(&uc->vc.lock, flags);
+}
+EXPORT_SYMBOL_GPL(udma_issue_pending);
+
+int udma_terminate_all(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	unsigned long flags;
+	LIST_HEAD(head);
+
+	spin_lock_irqsave(&uc->vc.lock, flags);
+
+	if (udma_is_chan_running(uc))
+		uc->ud->stop(uc);
+
+	if (uc->desc) {
+		uc->terminated_desc = uc->desc;
+		uc->desc = NULL;
+		uc->terminated_desc->terminated = true;
+		cancel_delayed_work(&uc->tx_drain.work);
+	}
+
+	uc->paused = false;
+
+	vchan_get_all_descriptors(&uc->vc, &head);
+	spin_unlock_irqrestore(&uc->vc.lock, flags);
+	vchan_dma_desc_free_list(&uc->vc, &head);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_terminate_all);
+
+void udma_synchronize(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	unsigned long timeout = msecs_to_jiffies(1000);
+
+	vchan_synchronize(&uc->vc);
+
+	if (uc->state == UDMA_CHAN_IS_TERMINATING) {
+		timeout = wait_for_completion_timeout(&uc->teardown_completed,
+						      timeout);
+		if (!timeout) {
+			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
+				 uc->id);
+			udma_dump_chan_stdata(uc);
+			uc->ud->reset_chan(uc, true);
+		}
+	}
+
+	uc->ud->reset_chan(uc, false);
+	if (udma_is_chan_running(uc))
+		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
+
+	cancel_delayed_work_sync(&uc->tx_drain.work);
+	udma_reset_rings(uc);
+}
+EXPORT_SYMBOL_GPL(udma_synchronize);
+
+/*
+ * This tasklet handles the completion of a DMA descriptor by
+ * calling its callback and freeing it.
+ */
+void udma_vchan_complete(struct tasklet_struct *t)
+{
+	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
+	struct virt_dma_desc *vd, *_vd;
+	struct dmaengine_desc_callback cb;
+	LIST_HEAD(head);
+
+	spin_lock_irq(&vc->lock);
+	list_splice_tail_init(&vc->desc_completed, &head);
+	vd = vc->cyclic;
+	if (vd) {
+		vc->cyclic = NULL;
+		dmaengine_desc_get_callback(&vd->tx, &cb);
+	} else {
+		memset(&cb, 0, sizeof(cb));
+	}
+	spin_unlock_irq(&vc->lock);
+
+	udma_desc_pre_callback(vc, vd, NULL);
+	dmaengine_desc_callback_invoke(&cb, NULL);
+
+	list_for_each_entry_safe(vd, _vd, &head, node) {
+		struct dmaengine_result result;
+
+		dmaengine_desc_get_callback(&vd->tx, &cb);
+
+		list_del(&vd->node);
+
+		udma_desc_pre_callback(vc, vd, &result);
+		dmaengine_desc_callback_invoke(&cb, &result);
+
+		vchan_vdesc_fini(vd);
+	}
+}
+EXPORT_SYMBOL_GPL(udma_vchan_complete);
+
+void udma_mark_resource_ranges(struct udma_dev *ud, unsigned long *map,
+			       struct ti_sci_resource_desc *rm_desc,
+			       char *name)
+{
+	bitmap_clear(map, rm_desc->start, rm_desc->num);
+	bitmap_clear(map, rm_desc->start_sec, rm_desc->num_sec);
+	dev_dbg(ud->dev, "ti_sci resource range for %s: %d:%d | %d:%d\n", name,
+		rm_desc->start, rm_desc->num, rm_desc->start_sec,
+		rm_desc->num_sec);
+}
+EXPORT_SYMBOL_GPL(udma_mark_resource_ranges);
+
+int udma_setup_rx_flush(struct udma_dev *ud)
+{
+	struct udma_rx_flush *rx_flush = &ud->rx_flush;
+	struct cppi5_desc_hdr_t *tr_desc;
+	struct cppi5_tr_type1_t *tr_req;
+	struct cppi5_host_desc_t *desc;
+	struct device *dev = ud->dev;
+	struct udma_hwdesc *hwdesc;
+	size_t tr_size;
+
+	/* Allocate 1K buffer for discarded data on RX channel teardown */
+	rx_flush->buffer_size = SZ_1K;
+	rx_flush->buffer_vaddr = devm_kzalloc(dev, rx_flush->buffer_size,
+					      GFP_KERNEL);
+	if (!rx_flush->buffer_vaddr)
+		return -ENOMEM;
+
+	rx_flush->buffer_paddr = dma_map_single(dev, rx_flush->buffer_vaddr,
+						rx_flush->buffer_size,
+						DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, rx_flush->buffer_paddr))
+		return -ENOMEM;
+
+	/* Set up descriptor to be used for TR mode */
+	hwdesc = &rx_flush->hwdescs[0];
+	tr_size = sizeof(struct cppi5_tr_type1_t);
+	hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size, 1);
+	hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
+					ud->desc_align);
+
+	hwdesc->cppi5_desc_vaddr = devm_kzalloc(dev, hwdesc->cppi5_desc_size,
+						GFP_KERNEL);
+	if (!hwdesc->cppi5_desc_vaddr)
+		return -ENOMEM;
+
+	hwdesc->cppi5_desc_paddr = dma_map_single(dev, hwdesc->cppi5_desc_vaddr,
+						  hwdesc->cppi5_desc_size,
+						  DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
+		return -ENOMEM;
+
+	/* Start of the TR req records */
+	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
+	/* Start address of the TR response array */
+	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size;
+
+	tr_desc = hwdesc->cppi5_desc_vaddr;
+	cppi5_trdesc_init(tr_desc, 1, tr_size, 0, 0);
+	cppi5_desc_set_pktids(tr_desc, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+	cppi5_desc_set_retpolicy(tr_desc, 0, 0);
+
+	tr_req = hwdesc->tr_req_base;
+	cppi5_tr_init(&tr_req->flags, CPPI5_TR_TYPE1, false, false,
+		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+	cppi5_tr_csf_set(&tr_req->flags, CPPI5_TR_CSF_SUPR_EVT);
+
+	tr_req->addr = rx_flush->buffer_paddr;
+	tr_req->icnt0 = rx_flush->buffer_size;
+	tr_req->icnt1 = 1;
+
+	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
+				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
+
+	/* Set up descriptor to be used for packet mode */
+	hwdesc = &rx_flush->hwdescs[1];
+	hwdesc->cppi5_desc_size = ALIGN(sizeof(struct cppi5_host_desc_t) +
+					CPPI5_INFO0_HDESC_EPIB_SIZE +
+					CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE,
+					ud->desc_align);
+
+	hwdesc->cppi5_desc_vaddr = devm_kzalloc(dev, hwdesc->cppi5_desc_size,
+						GFP_KERNEL);
+	if (!hwdesc->cppi5_desc_vaddr)
+		return -ENOMEM;
+
+	hwdesc->cppi5_desc_paddr = dma_map_single(dev, hwdesc->cppi5_desc_vaddr,
+						  hwdesc->cppi5_desc_size,
+						  DMA_TO_DEVICE);
+	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
+		return -ENOMEM;
+
+	desc = hwdesc->cppi5_desc_vaddr;
+	cppi5_hdesc_init(desc, 0, 0);
+	cppi5_desc_set_pktids(&desc->hdr, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+	cppi5_desc_set_retpolicy(&desc->hdr, 0, 0);
+
+	cppi5_hdesc_attach_buf(desc,
+			       rx_flush->buffer_paddr, rx_flush->buffer_size,
+			       rx_flush->buffer_paddr, rx_flush->buffer_size);
+
+	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
+				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(udma_setup_rx_flush);
+
+#ifdef CONFIG_DEBUG_FS
+void udma_dbg_summary_show_chan(struct seq_file *s,
+				struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_chan_config *ucc = &uc->config;
+
+	seq_printf(s, " %-13s| %s", dma_chan_name(chan),
+		   chan->dbg_client_name ?: "in-use");
+	if (ucc->tr_trigger_type)
+		seq_puts(s, " (triggered, ");
+	else
+		seq_printf(s, " (%s, ",
+			   dmaengine_get_direction_text(uc->config.dir));
+
+	switch (uc->config.dir) {
+	case DMA_MEM_TO_MEM:
+		if (uc->ud->match_data->type == DMA_TYPE_BCDMA) {
+			seq_printf(s, "bchan%d)\n", uc->bchan->id);
+			return;
+		}
+
+		seq_printf(s, "chan%d pair [0x%04x -> 0x%04x], ", uc->tchan->id,
+			   ucc->src_thread, ucc->dst_thread);
+		break;
+	case DMA_DEV_TO_MEM:
+		seq_printf(s, "rchan%d [0x%04x -> 0x%04x], ", uc->rchan->id,
+			   ucc->src_thread, ucc->dst_thread);
+		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA)
+			seq_printf(s, "rflow%d, ", uc->rflow->id);
+		break;
+	case DMA_MEM_TO_DEV:
+		seq_printf(s, "tchan%d [0x%04x -> 0x%04x], ", uc->tchan->id,
+			   ucc->src_thread, ucc->dst_thread);
+		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA)
+			seq_printf(s, "tflow%d, ", uc->tchan->tflow_id);
+		break;
+	default:
+		seq_printf(s, ")\n");
+		return;
+	}
+
+	if (ucc->ep_type == PSIL_EP_NATIVE) {
+		seq_printf(s, "PSI-L Native");
+		if (ucc->metadata_size) {
+			seq_printf(s, "[%s", ucc->needs_epib ? " EPIB" : "");
+			if (ucc->psd_size)
+				seq_printf(s, " PSDsize:%u", ucc->psd_size);
+			seq_printf(s, " ]");
+		}
+	} else {
+		seq_printf(s, "PDMA");
+		if (ucc->enable_acc32 || ucc->enable_burst)
+			seq_printf(s, "[%s%s ]",
+				   ucc->enable_acc32 ? " ACC32" : "",
+				   ucc->enable_burst ? " BURST" : "");
+	}
+
+	seq_printf(s, ", %s)\n", ucc->pkt_mode ? "Packet mode" : "TR mode");
+}
+
+void udma_dbg_summary_show(struct seq_file *s,
+			   struct dma_device *dma_dev)
+{
+	struct dma_chan *chan;
+
+	list_for_each_entry(chan, &dma_dev->channels, device_node) {
+		if (chan->client_count)
+			udma_dbg_summary_show_chan(s, chan);
+	}
+}
+EXPORT_SYMBOL_GPL(udma_dbg_summary_show);
+#endif /* CONFIG_DEBUG_FS */
+
+enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
+{
+	const struct udma_match_data *match_data = ud->match_data;
+	u8 tpl;
+
+	if (!match_data->enable_memcpy_support)
+		return DMAENGINE_ALIGN_8_BYTES;
+
+	/* Get the highest TPL level the device supports for memcpy */
+	if (ud->bchan_cnt)
+		tpl = udma_get_chan_tpl_index(&ud->bchan_tpl, 0);
+	else if (ud->tchan_cnt)
+		tpl = udma_get_chan_tpl_index(&ud->tchan_tpl, 0);
+	else
+		return DMAENGINE_ALIGN_8_BYTES;
+
+	switch (match_data->burst_size[tpl]) {
+	case TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_256_BYTES:
+		return DMAENGINE_ALIGN_256_BYTES;
+	case TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_128_BYTES:
+		return DMAENGINE_ALIGN_128_BYTES;
+	case TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES:
+	fallthrough;
+	default:
+		return DMAENGINE_ALIGN_64_BYTES;
+	}
+}
+EXPORT_SYMBOL_GPL(udma_get_copy_align);
+
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 36dcc888815ea..cd73bf03e9cc6 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -61,92 +61,6 @@ int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
 						src_thread, dst_thread);
 }
 
-static void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel)
-{
-	struct device *chan_dev = dmaengine_chan_dev(chan);
-
-	if (asel == 0) {
-		/* No special handling for the channel */
-		chan->chan_dev->chan_dma_dev = false;
-
-		dev_clear_dma_coherent(chan_dev);
-		chan_dev->dma_parms = NULL;
-	} else if (asel == 14 || asel == 15) {
-		chan->chan_dev->chan_dma_dev = true;
-
-		dev_set_dma_coherent(chan_dev);
-		dma_coerce_mask_and_coherent(chan_dev, DMA_BIT_MASK(48));
-		chan_dev->dma_parms = chan_dev->parent->dma_parms;
-	} else {
-		dev_warn(chan->device->dev, "Invalid ASEL value: %u\n", asel);
-
-		dev_clear_dma_coherent(chan_dev);
-		chan_dev->dma_parms = NULL;
-	}
-}
-
-static u8 udma_get_chan_tpl_index(struct udma_tpl *tpl_map, int chan_id)
-{
-	int i;
-
-	for (i = 0; i < tpl_map->levels; i++) {
-		if (chan_id >= tpl_map->start_idx[i])
-			return i;
-	}
-
-	return 0;
-}
-
-static void udma_reset_uchan(struct udma_chan *uc)
-{
-	memset(&uc->config, 0, sizeof(uc->config));
-	uc->config.remote_thread_id = -1;
-	uc->config.mapped_channel_id = -1;
-	uc->config.default_flow_id = -1;
-	uc->state = UDMA_CHAN_IS_IDLE;
-}
-
-static void udma_dump_chan_stdata(struct udma_chan *uc)
-{
-	struct device *dev = uc->ud->dev;
-	u32 offset;
-	int i;
-
-	if (uc->config.dir == DMA_MEM_TO_DEV || uc->config.dir == DMA_MEM_TO_MEM) {
-		dev_dbg(dev, "TCHAN State data:\n");
-		for (i = 0; i < 32; i++) {
-			offset = UDMA_CHAN_RT_STDATA_REG + i * 4;
-			dev_dbg(dev, "TRT_STDATA[%02d]: 0x%08x\n", i,
-				udma_tchanrt_read(uc, offset));
-		}
-	}
-
-	if (uc->config.dir == DMA_DEV_TO_MEM || uc->config.dir == DMA_MEM_TO_MEM) {
-		dev_dbg(dev, "RCHAN State data:\n");
-		for (i = 0; i < 32; i++) {
-			offset = UDMA_CHAN_RT_STDATA_REG + i * 4;
-			dev_dbg(dev, "RRT_STDATA[%02d]: 0x%08x\n", i,
-				udma_rchanrt_read(uc, offset));
-		}
-	}
-}
-
-static bool udma_is_chan_running(struct udma_chan *uc)
-{
-	u32 trt_ctl = 0;
-	u32 rrt_ctl = 0;
-
-	if (uc->tchan)
-		trt_ctl = udma_tchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
-	if (uc->rchan)
-		rrt_ctl = udma_rchanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
-
-	if (trt_ctl & UDMA_CHAN_RT_CTL_EN || rrt_ctl & UDMA_CHAN_RT_CTL_EN)
-		return true;
-
-	return false;
-}
-
 static bool udma_is_chan_paused(struct udma_chan *uc)
 {
 	u32 val, pause_mask;
@@ -275,40 +189,6 @@ static int udma_reset_chan(struct udma_chan *uc, bool hard)
 	return 0;
 }
 
-static void udma_start_desc(struct udma_chan *uc)
-{
-	struct udma_chan_config *ucc = &uc->config;
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA && ucc->pkt_mode &&
-	    (uc->cyclic || ucc->dir == DMA_DEV_TO_MEM)) {
-		int i;
-
-		/*
-		 * UDMA only: Push all descriptors to ring for packet mode
-		 * cyclic or RX
-		 * PKTDMA supports pre-linked descriptor and cyclic is not
-		 * supported
-		 */
-		for (i = 0; i < uc->desc->sglen; i++)
-			udma_push_to_ring(uc, i);
-	} else {
-		udma_push_to_ring(uc, 0);
-	}
-}
-
-static bool udma_chan_needs_reconfiguration(struct udma_chan *uc)
-{
-	/* Only PDMAs have staticTR */
-	if (uc->config.ep_type == PSIL_EP_NATIVE)
-		return false;
-
-	/* Check if the staticTR configuration has changed for TX */
-	if (memcmp(&uc->static_tr, &uc->desc->static_tr, sizeof(uc->static_tr)))
-		return true;
-
-	return false;
-}
-
 static int udma_start(struct udma_chan *uc)
 {
 	struct virt_dma_desc *vd = vchan_next_desc(&uc->vc);
@@ -453,86 +333,6 @@ static int udma_stop(struct udma_chan *uc)
 	return 0;
 }
 
-static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
-{
-	struct udma_desc *d = uc->desc;
-	struct cppi5_host_desc_t *h_desc;
-
-	h_desc = d->hwdesc[d->desc_idx].cppi5_desc_vaddr;
-	cppi5_hdesc_reset_to_original(h_desc);
-	udma_push_to_ring(uc, d->desc_idx);
-	d->desc_idx = (d->desc_idx + 1) % d->sglen;
-}
-
-static void udma_check_tx_completion(struct work_struct *work)
-{
-	struct udma_chan *uc = container_of(work, typeof(*uc),
-					    tx_drain.work.work);
-	bool desc_done = true;
-	u32 residue_diff;
-	ktime_t time_diff;
-	unsigned long delay;
-	unsigned long flags;
-
-	while (1) {
-		spin_lock_irqsave(&uc->vc.lock, flags);
-
-		if (uc->desc) {
-			/* Get previous residue and time stamp */
-			residue_diff = uc->tx_drain.residue;
-			time_diff = uc->tx_drain.tstamp;
-			/*
-			 * Get current residue and time stamp or see if
-			 * transfer is complete
-			 */
-			desc_done = udma_is_desc_really_done(uc, uc->desc);
-		}
-
-		if (!desc_done) {
-			/*
-			 * Find the time delta and residue delta w.r.t
-			 * previous poll
-			 */
-			time_diff = ktime_sub(uc->tx_drain.tstamp,
-					      time_diff) + 1;
-			residue_diff -= uc->tx_drain.residue;
-			if (residue_diff) {
-				/*
-				 * Try to guess when we should check
-				 * next time by calculating rate at
-				 * which data is being drained at the
-				 * peer device
-				 */
-				delay = (time_diff / residue_diff) *
-					uc->tx_drain.residue;
-			} else {
-				/* No progress, check again in 1 second  */
-				schedule_delayed_work(&uc->tx_drain.work, HZ);
-				break;
-			}
-
-			spin_unlock_irqrestore(&uc->vc.lock, flags);
-
-			usleep_range(ktime_to_us(delay),
-				     ktime_to_us(delay) + 10);
-			continue;
-		}
-
-		if (uc->desc) {
-			struct udma_desc *d = uc->desc;
-
-			uc->ud->decrement_byte_counters(uc, d->residue);
-			uc->ud->start(uc);
-			vchan_cookie_complete(&d->vd);
-			break;
-		}
-
-		break;
-	}
-
-	spin_unlock_irqrestore(&uc->vc.lock, flags);
-}
-
 static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 {
 	struct udma_chan *uc = data;
@@ -2097,38 +1897,6 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 	return ret;
 }
 
-static int udma_slave_config(struct dma_chan *chan,
-			     struct dma_slave_config *cfg)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-
-	memcpy(&uc->cfg, cfg, sizeof(uc->cfg));
-
-	return 0;
-}
-
-static void udma_issue_pending(struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&uc->vc.lock, flags);
-
-	/* If we have something pending and no active descriptor, then */
-	if (vchan_issue_pending(&uc->vc) && !uc->desc) {
-		/*
-		 * start a descriptor if the channel is NOT [marked as
-		 * terminating _and_ it is still running (teardown has not
-		 * completed yet)].
-		 */
-		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
-		      udma_is_chan_running(uc)))
-			uc->ud->start(uc);
-	}
-
-	spin_unlock_irqrestore(&uc->vc.lock, flags);
-}
-
 static enum dma_status udma_tx_status(struct dma_chan *chan,
 				      dma_cookie_t cookie,
 				      struct dma_tx_state *txstate)
@@ -2256,98 +2024,6 @@ static int udma_resume(struct dma_chan *chan)
 	return 0;
 }
 
-static int udma_terminate_all(struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	unsigned long flags;
-	LIST_HEAD(head);
-
-	spin_lock_irqsave(&uc->vc.lock, flags);
-
-	if (udma_is_chan_running(uc))
-		uc->ud->stop(uc);
-
-	if (uc->desc) {
-		uc->terminated_desc = uc->desc;
-		uc->desc = NULL;
-		uc->terminated_desc->terminated = true;
-		cancel_delayed_work(&uc->tx_drain.work);
-	}
-
-	uc->paused = false;
-
-	vchan_get_all_descriptors(&uc->vc, &head);
-	spin_unlock_irqrestore(&uc->vc.lock, flags);
-	vchan_dma_desc_free_list(&uc->vc, &head);
-
-	return 0;
-}
-
-static void udma_synchronize(struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	unsigned long timeout = msecs_to_jiffies(1000);
-
-	vchan_synchronize(&uc->vc);
-
-	if (uc->state == UDMA_CHAN_IS_TERMINATING) {
-		timeout = wait_for_completion_timeout(&uc->teardown_completed,
-						      timeout);
-		if (!timeout) {
-			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
-				 uc->id);
-			udma_dump_chan_stdata(uc);
-			uc->ud->reset_chan(uc, true);
-		}
-	}
-
-	uc->ud->reset_chan(uc, false);
-	if (udma_is_chan_running(uc))
-		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
-
-	cancel_delayed_work_sync(&uc->tx_drain.work);
-	udma_reset_rings(uc);
-}
-
-/*
- * This tasklet handles the completion of a DMA descriptor by
- * calling its callback and freeing it.
- */
-static void udma_vchan_complete(struct tasklet_struct *t)
-{
-	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
-	struct virt_dma_desc *vd, *_vd;
-	struct dmaengine_desc_callback cb;
-	LIST_HEAD(head);
-
-	spin_lock_irq(&vc->lock);
-	list_splice_tail_init(&vc->desc_completed, &head);
-	vd = vc->cyclic;
-	if (vd) {
-		vc->cyclic = NULL;
-		dmaengine_desc_get_callback(&vd->tx, &cb);
-	} else {
-		memset(&cb, 0, sizeof(cb));
-	}
-	spin_unlock_irq(&vc->lock);
-
-	udma_desc_pre_callback(vc, vd, NULL);
-	dmaengine_desc_callback_invoke(&cb, NULL);
-
-	list_for_each_entry_safe(vd, _vd, &head, node) {
-		struct dmaengine_result result;
-
-		dmaengine_desc_get_callback(&vd->tx, &cb);
-
-		list_del(&vd->node);
-
-		udma_desc_pre_callback(vc, vd, &result);
-		dmaengine_desc_callback_invoke(&cb, &result);
-
-		vchan_vdesc_fini(vd);
-	}
-}
-
 static void udma_free_chan_resources(struct dma_chan *chan)
 {
 	struct udma_chan *uc = to_udma_chan(chan);
@@ -2822,17 +2498,6 @@ static int udma_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
 	return 0;
 }
 
-static void udma_mark_resource_ranges(struct udma_dev *ud, unsigned long *map,
-				      struct ti_sci_resource_desc *rm_desc,
-				      char *name)
-{
-	bitmap_clear(map, rm_desc->start, rm_desc->num);
-	bitmap_clear(map, rm_desc->start_sec, rm_desc->num_sec);
-	dev_dbg(ud->dev, "ti_sci resource range for %s: %d:%d | %d:%d\n", name,
-		rm_desc->start, rm_desc->num, rm_desc->start_sec,
-		rm_desc->num_sec);
-}
-
 static const char * const range_names[] = {
 	[RM_RANGE_BCHAN] = "ti,sci-rm-range-bchan",
 	[RM_RANGE_TCHAN] = "ti,sci-rm-range-tchan",
@@ -3463,202 +3128,6 @@ static int setup_resources(struct udma_dev *ud)
 	return ch_count;
 }
 
-static int udma_setup_rx_flush(struct udma_dev *ud)
-{
-	struct udma_rx_flush *rx_flush = &ud->rx_flush;
-	struct cppi5_desc_hdr_t *tr_desc;
-	struct cppi5_tr_type1_t *tr_req;
-	struct cppi5_host_desc_t *desc;
-	struct device *dev = ud->dev;
-	struct udma_hwdesc *hwdesc;
-	size_t tr_size;
-
-	/* Allocate 1K buffer for discarded data on RX channel teardown */
-	rx_flush->buffer_size = SZ_1K;
-	rx_flush->buffer_vaddr = devm_kzalloc(dev, rx_flush->buffer_size,
-					      GFP_KERNEL);
-	if (!rx_flush->buffer_vaddr)
-		return -ENOMEM;
-
-	rx_flush->buffer_paddr = dma_map_single(dev, rx_flush->buffer_vaddr,
-						rx_flush->buffer_size,
-						DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, rx_flush->buffer_paddr))
-		return -ENOMEM;
-
-	/* Set up descriptor to be used for TR mode */
-	hwdesc = &rx_flush->hwdescs[0];
-	tr_size = sizeof(struct cppi5_tr_type1_t);
-	hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size, 1);
-	hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
-					ud->desc_align);
-
-	hwdesc->cppi5_desc_vaddr = devm_kzalloc(dev, hwdesc->cppi5_desc_size,
-						GFP_KERNEL);
-	if (!hwdesc->cppi5_desc_vaddr)
-		return -ENOMEM;
-
-	hwdesc->cppi5_desc_paddr = dma_map_single(dev, hwdesc->cppi5_desc_vaddr,
-						  hwdesc->cppi5_desc_size,
-						  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
-		return -ENOMEM;
-
-	/* Start of the TR req records */
-	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
-	/* Start address of the TR response array */
-	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size;
-
-	tr_desc = hwdesc->cppi5_desc_vaddr;
-	cppi5_trdesc_init(tr_desc, 1, tr_size, 0, 0);
-	cppi5_desc_set_pktids(tr_desc, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-	cppi5_desc_set_retpolicy(tr_desc, 0, 0);
-
-	tr_req = hwdesc->tr_req_base;
-	cppi5_tr_init(&tr_req->flags, CPPI5_TR_TYPE1, false, false,
-		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-	cppi5_tr_csf_set(&tr_req->flags, CPPI5_TR_CSF_SUPR_EVT);
-
-	tr_req->addr = rx_flush->buffer_paddr;
-	tr_req->icnt0 = rx_flush->buffer_size;
-	tr_req->icnt1 = 1;
-
-	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
-				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
-
-	/* Set up descriptor to be used for packet mode */
-	hwdesc = &rx_flush->hwdescs[1];
-	hwdesc->cppi5_desc_size = ALIGN(sizeof(struct cppi5_host_desc_t) +
-					CPPI5_INFO0_HDESC_EPIB_SIZE +
-					CPPI5_INFO0_HDESC_PSDATA_MAX_SIZE,
-					ud->desc_align);
-
-	hwdesc->cppi5_desc_vaddr = devm_kzalloc(dev, hwdesc->cppi5_desc_size,
-						GFP_KERNEL);
-	if (!hwdesc->cppi5_desc_vaddr)
-		return -ENOMEM;
-
-	hwdesc->cppi5_desc_paddr = dma_map_single(dev, hwdesc->cppi5_desc_vaddr,
-						  hwdesc->cppi5_desc_size,
-						  DMA_TO_DEVICE);
-	if (dma_mapping_error(dev, hwdesc->cppi5_desc_paddr))
-		return -ENOMEM;
-
-	desc = hwdesc->cppi5_desc_vaddr;
-	cppi5_hdesc_init(desc, 0, 0);
-	cppi5_desc_set_pktids(&desc->hdr, 0, CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-	cppi5_desc_set_retpolicy(&desc->hdr, 0, 0);
-
-	cppi5_hdesc_attach_buf(desc,
-			       rx_flush->buffer_paddr, rx_flush->buffer_size,
-			       rx_flush->buffer_paddr, rx_flush->buffer_size);
-
-	dma_sync_single_for_device(dev, hwdesc->cppi5_desc_paddr,
-				   hwdesc->cppi5_desc_size, DMA_TO_DEVICE);
-	return 0;
-}
-
-#ifdef CONFIG_DEBUG_FS
-static void udma_dbg_summary_show_chan(struct seq_file *s,
-				       struct dma_chan *chan)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	struct udma_chan_config *ucc = &uc->config;
-
-	seq_printf(s, " %-13s| %s", dma_chan_name(chan),
-		   chan->dbg_client_name ?: "in-use");
-	if (ucc->tr_trigger_type)
-		seq_puts(s, " (triggered, ");
-	else
-		seq_printf(s, " (%s, ",
-			   dmaengine_get_direction_text(uc->config.dir));
-
-	switch (uc->config.dir) {
-	case DMA_MEM_TO_MEM:
-		if (uc->ud->match_data->type == DMA_TYPE_BCDMA) {
-			seq_printf(s, "bchan%d)\n", uc->bchan->id);
-			return;
-		}
-
-		seq_printf(s, "chan%d pair [0x%04x -> 0x%04x], ", uc->tchan->id,
-			   ucc->src_thread, ucc->dst_thread);
-		break;
-	case DMA_DEV_TO_MEM:
-		seq_printf(s, "rchan%d [0x%04x -> 0x%04x], ", uc->rchan->id,
-			   ucc->src_thread, ucc->dst_thread);
-		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA)
-			seq_printf(s, "rflow%d, ", uc->rflow->id);
-		break;
-	case DMA_MEM_TO_DEV:
-		seq_printf(s, "tchan%d [0x%04x -> 0x%04x], ", uc->tchan->id,
-			   ucc->src_thread, ucc->dst_thread);
-		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA)
-			seq_printf(s, "tflow%d, ", uc->tchan->tflow_id);
-		break;
-	default:
-		seq_printf(s, ")\n");
-		return;
-	}
-
-	if (ucc->ep_type == PSIL_EP_NATIVE) {
-		seq_printf(s, "PSI-L Native");
-		if (ucc->metadata_size) {
-			seq_printf(s, "[%s", ucc->needs_epib ? " EPIB" : "");
-			if (ucc->psd_size)
-				seq_printf(s, " PSDsize:%u", ucc->psd_size);
-			seq_printf(s, " ]");
-		}
-	} else {
-		seq_printf(s, "PDMA");
-		if (ucc->enable_acc32 || ucc->enable_burst)
-			seq_printf(s, "[%s%s ]",
-				   ucc->enable_acc32 ? " ACC32" : "",
-				   ucc->enable_burst ? " BURST" : "");
-	}
-
-	seq_printf(s, ", %s)\n", ucc->pkt_mode ? "Packet mode" : "TR mode");
-}
-
-static void udma_dbg_summary_show(struct seq_file *s,
-				  struct dma_device *dma_dev)
-{
-	struct dma_chan *chan;
-
-	list_for_each_entry(chan, &dma_dev->channels, device_node) {
-		if (chan->client_count)
-			udma_dbg_summary_show_chan(s, chan);
-	}
-}
-#endif /* CONFIG_DEBUG_FS */
-
-static enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud)
-{
-	const struct udma_match_data *match_data = ud->match_data;
-	u8 tpl;
-
-	if (!match_data->enable_memcpy_support)
-		return DMAENGINE_ALIGN_8_BYTES;
-
-	/* Get the highest TPL level the device supports for memcpy */
-	if (ud->bchan_cnt)
-		tpl = udma_get_chan_tpl_index(&ud->bchan_tpl, 0);
-	else if (ud->tchan_cnt)
-		tpl = udma_get_chan_tpl_index(&ud->tchan_tpl, 0);
-	else
-		return DMAENGINE_ALIGN_8_BYTES;
-
-	switch (match_data->burst_size[tpl]) {
-	case TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_256_BYTES:
-		return DMAENGINE_ALIGN_256_BYTES;
-	case TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_128_BYTES:
-		return DMAENGINE_ALIGN_128_BYTES;
-	case TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES:
-	fallthrough;
-	default:
-		return DMAENGINE_ALIGN_64_BYTES;
-	}
-}
-
 static int udma_probe(struct platform_device *pdev)
 {
 	struct device_node *navss_node = pdev->dev.parent->of_node;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 59170714f53cc..a6d7aba83a09b 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -587,9 +587,6 @@ struct dma_async_tx_descriptor *udma_prep_dma_cyclic(struct dma_chan *chan, dma_
 struct dma_async_tx_descriptor *udma_prep_dma_memcpy(struct dma_chan *chan,
 						     dma_addr_t dest, dma_addr_t src,
 						     size_t len, unsigned long tx_flags);
-void udma_desc_pre_callback(struct virt_dma_chan *vc,
-			    struct virt_dma_desc *vd,
-			    struct dmaengine_result *result);
 
 int udma_push_to_ring(struct udma_chan *uc, int idx);
 int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
@@ -597,6 +594,34 @@ void udma_reset_rings(struct udma_chan *uc);
 
 int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+void udma_start_desc(struct udma_chan *uc);
+u8 udma_get_chan_tpl_index(struct udma_tpl *tpl_map, int chan_id);
+void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel);
+void udma_reset_uchan(struct udma_chan *uc);
+void udma_dump_chan_stdata(struct udma_chan *uc);
+bool udma_is_chan_running(struct udma_chan *uc);
+
+bool udma_chan_needs_reconfiguration(struct udma_chan *uc);
+void udma_cyclic_packet_elapsed(struct udma_chan *uc);
+void udma_check_tx_completion(struct work_struct *work);
+int udma_slave_config(struct dma_chan *chan,
+		      struct dma_slave_config *cfg);
+void udma_issue_pending(struct dma_chan *chan);
+int udma_terminate_all(struct dma_chan *chan);
+void udma_synchronize(struct dma_chan *chan);
+void udma_vchan_complete(struct tasklet_struct *t);
+void udma_mark_resource_ranges(struct udma_dev *ud, unsigned long *map,
+			       struct ti_sci_resource_desc *rm_desc,
+			       char *name);
+int udma_setup_rx_flush(struct udma_dev *ud);
+enum dmaengine_alignment udma_get_copy_align(struct udma_dev *ud);
+
+#ifdef CONFIG_DEBUG_FS
+void udma_dbg_summary_show_chan(struct seq_file *s,
+				struct dma_chan *chan);
+void udma_dbg_summary_show(struct seq_file *s,
+			   struct dma_device *dma_dev);
+#endif /* CONFIG_DEBUG_FS */
 
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
-- 
2.55.0

