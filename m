Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA838423E91;
	Fri, 24 Jul 2026 10:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888568; cv=fail; b=GAKw0cjIXFst3KYimEFDem/gfJiLtGvfxK65CvtUGlKoNn96hAldb0xv+/dEIiLPt6j8xQOujg6lSTjmyujOPWAyWfWJYnjWQ2VTgU8W4KoezRtOMFWw0Vp4EgmwIuolH0euTdLDftya3JJ6IXzdzG/wPpArF0Dnov5FMMkbD5I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888568; c=relaxed/simple;
	bh=ZcLThQ2hYQw4KY9I9h8PaHbn9C3vLljLhMlhD7XbqcI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gc9fKIV4XN7K2TwkX3IDx1mAzMux0aNtMF2C8lHPaGkP74Cu3tiVJFVePcQjh5l+uGDt+oA9slfqpv4HQ6qdZ82IgUzdzaePSHKgLghjAUzacRy/qJFcRbG3LrX65nnT4J7p19ciCdTM9KYz6rrt+N9fJfbKXX4c4vtaWFtbb+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=NWVQUIwQ; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AZq/sx91; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="NWVQUIwQ";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AZq/sx91"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFTTu1093779;
	Fri, 24 Jul 2026 05:22:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=WwDxHefWibjKCJVfzeekGDFElgQz1afsxNB+GV07g
	Is=; b=NWVQUIwQb4hRQ6WEY4k1Igxc3m64679fOfoYoIqnrch4djRvrOhf3sT9L
	FoGnrJLsswSBQ2t4qjqvHI0OxnebbFObHxRRKhIkgDnLyxXqtohduzjdLAqVa8kf
	AycSIkPw+5inXD775sFstQ+AwW/eO0ej1rnz7/VKW+OPe3z24uovEJkdtr1AIlNM
	jcyNz+3dDvSI9ARlMVIS1GM2dAPmpP8QG0h9QWMqq53zAL6X8XmA+QjcWVS8A+4h
	5G8MzR3CRxiqoypnN5H61uXLosBdAYy40WhOodvVL4TWEj/UPAyELtOKXRda1ai9
	yYIqb7z2gPFTIdAWeOpI6GbxwvOIg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010016.outbound.protection.outlook.com [52.101.61.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkyp7j3yc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:31 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUJcv7XtYIBD4kahIRp5xUl46R4yEuEl/eun7XzMnXshAMTE8QGLakyDMVixEpvNCcpVnGCGZrTNOBPVBm3woAlDVb8v+rYAs/KqGF6eJRUC16TH2ohP0DvPsAhW9KZ7KS9M1qDn4AqqV/sEGuUzPdqGmzcjIG0CgGVDdJVlb3uIf+tV9oJDyx/jV4AtrE8z/r+RsRydd3ETKHihkL3y2HYHZz1N+Mw9MAd1k8GnwByoeuSaOs6WhYi9nEDBgxblA/IBteKBh/Kl7si/tt8wYzFg0VIZx0+bbi+sB/BWW4wn6bFGi0nvjsBPs40qT9Q9e8cnxpR7ZdEX4pZq/Qx7Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwDxHefWibjKCJVfzeekGDFElgQz1afsxNB+GV07gIs=;
 b=jyJ8W396fgaTjos7UEkstk0sS0gZJN6yGNfTyBvYNhZwIWytEFzqWjsY/DS1AR+6K82+IZBwp+im+zBBbs/bIZGpvkcmOl1ODCij3CwLMc5L3BO6Xe8AjM+RjbsPcy7sma3aMhOm+BEgOXzyjbMaUPQf+MuLgq9scP9YV2F+3DzUZHbSHcf+6lwQPKtgMhJaCqtE/BXDXHK6C665N+zPjhVxbXEjGQWyCSJ3hyT7HjO66oH0D1AJsXwaLRLHiznfnndISBXEhABr/KCOFqBkm2o4WCyqh57sIgVaMR0a38T6MXzbM8GUbTBZDtfNoY0eq55s5E2ZC97Iwn3QJRHxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwDxHefWibjKCJVfzeekGDFElgQz1afsxNB+GV07gIs=;
 b=AZq/sx91izDZZRUjyUKOwx7DZ7QPs6iduOO3brBr8DW82dAT89EE2EaRobA0weprK+Lw3Lln0K88BVN7h1ymu22FZUdxmigBa9G5OQE7wJeswcM8FoKldEtvtGUZmXlKoufhqyIAseaUa25nQE1wnJ+C+dyckfQu9FsGIKi4uSA=
Received: from CH0PR03CA0383.namprd03.prod.outlook.com (2603:10b6:610:119::18)
 by DS7PR10MB5903.namprd10.prod.outlook.com (2603:10b6:8:85::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.11; Fri, 24 Jul 2026 10:22:26 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::3a) by CH0PR03CA0383.outlook.office365.com
 (2603:10b6:610:119::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend Transport; Fri,
 24 Jul 2026 10:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:26 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:24 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFQ3017088;
	Fri, 24 Jul 2026 05:22:19 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 11/19] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Fri, 24 Jul 2026 15:50:44 +0530
Message-ID: <20260724102115.2854-12-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DS7PR10MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 0335a6c8-292b-4ff4-db4a-08dee96d7595
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|23010399003|3023799007|56012099006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MdoFF8veaCOwM8rAaz/C/r1zFOXQxI4PlmMr3aLLv0CqRiVXly9MJxqbFPIIHTZzPAYi9dN13PYHq26S5TyPNu0xCil7XuH5mbri2jLNUePIPFQCXFG7+azcT4EvtO5Pzghn/P9SF88Vzh6QPJA1wiAHQitVXspl8VhNKBkvpi7Fpbl19hZMXAz0xzNjW1vPvuIYte3QJsNF074JgXZPQRGQIBn2FpGrd23zI6+005/GdintQMDF/l918F7Zs1Tnyb63BN3Jgs6h4rT2BrclrXm+AbfJ9XHkD2LKQitQVAhltKl3+7NpCWSZ3XCBTUTJ0Urz/MHtaUuclqXNFA2/C28OmOJ+rsTWf+bMI2O/7jg0uH6uDrtl5kZi3cujOVuutsTMk16ufJKB9ZpUI/MkWRr8PuhL+S2SkwAMUbEuYQaFLarIer7SDoN9/VS7KaRrS5Eb4b1Wvg+iE6tPA9XndWcmUvuzz3u1CZfToeBIlaeKtIgSM6XdRLz0yBk8/cjuU00SpnTFPw9K8kQ8m7q0vZyTnYS4PcRJB+u1k43Pn+sDt3yTyZKP85wdofZkdXY1v/xiA4/6MMVjybLx0ZAFL8vAKqw0qyBD+re/DsSyC8kWHCPZ/fYh1OK3YJARBnYafdjG7pxeSIhLDPeRI+sxeNRq/8a3x/gmVM2iuhTDIeyE3ZryVJq6nU8S8DQzwmLqayimunpNQvOM18FV8U18Mvs/R1/Ea0dGBJ9++y9oh7BqJ5lnZwUspPZCPilX2clX
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(23010399003)(3023799007)(56012099006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	usk34CQJpEdVmdnetgxQWGHIJEWIDf+SY6kMidej7DPxLoS/Nakhs1+1gqOWNhgUcN3iN9bup55gAEPjl69YaWpilDiZWGgf8YuWbzxP/matx6xgy6NcuFYeWwckWn+HBHbrTyl7tJtWf92TjT9IklpOs5hBgtfo3t01c4pKqoyFeJgEglkh1aAvVeqtWURLGPBmVCaE+FhALunEmwp+se+HDJbzZQW5TFg8YApI/hAtO1mk8iDrGXTshGQJmBp6UcZgVPMPQTy4Hb+f0Iw31rn5nS3+sJOoYNzlXZL1xs17kmH1MJkXDJIq9rlfjBuYkPUcJcv+4Pmba5NXrNsMdPtxPyJjWjqUO67fz8zzcCZSU3jPFpkvprOMqVX2gTa9x3S8q6Me8EKGWWh/FWIU+DkVDIVvluMcA+kqtyfvdhAdJyCHRzIdOBFYzv1w+ufV
X-Exchange-RoutingPolicyChecked:
	St8bTsph9WFeRyvGtoqwSJgYQoPMOqPB6gRL0acfKmhBTo8+t/gmOzigz/KM7SuX0kKTUKJ6DX/gIMmlCe6EmC8Sg8mDh3QajrhhFZOMI63yu3Jf5b60KicKSa4k51jBX0oZjGa2EXn2bQBFxr8ZDrZ92DH/+KoLUeggGvFfWhhvc81DY0bLx+f5XhRRKQn42gSg6u0DTJWjkevwL4RmiB0GLlaDBMu7PPyalzXWbN8bZTGivUSdX/AQ52iCVkozRfRe0akgH+s8R61ffB/4rw1MigmWIye33oFnu25ztCuhefMFy0GnmqVx+BA4VBJ0DT89ZB3kel68pHc1DmzxwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:26.5609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0335a6c8-292b-4ff4-db4a-08dee96d7595
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5903
X-Authority-Analysis: v=2.4 cv=M4p97Sws c=1 sm=1 tr=0 ts=6a633ce8 cx=c_pps
 a=ItoRIIcZIWT0tNr6APkIeA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=tBjUjbL6H5YkyfA7LM4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfXyQ29A7SYi8/T
 r9Mx8yIlrHNDmzXuPiPXV9wYNDmP+vz0E8bwArKV5azUnwZzt82vrOOteoYrVj+hiIUNnsKNHRv
 eNAo0mJ/5FIUVkR49kLDCHwZ5dZyOS4=
X-Proofpoint-ORIG-GUID: lSddF28NzF_3F4yFCWjPl5nvlWKiSErc
X-Proofpoint-GUID: lSddF28NzF_3F4yFCWjPl5nvlWKiSErc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX28uzInGB1smw
 z3lQevLCFtXil1PlkAjxdyCGuXo12Q6Yzfv+JOpPX2fokvtsTH0ySBmm5f6UcUMI8r3uejVXRSk
 U3XTIpMqgMQ96mNH4y6gZxaoJt1eX6t4s6sqf33bC4V57dYs35obaAHUJ/O2K/SvVldJZ/pdkiI
 EWRp3Mnu9424NR5znpmTmPDG36iJ9ALj0eRebN1NjQd7AzXpSPX/qiJJFBhFBnvD6JgK+sovjOI
 0klp07500n9AbDvnRpjh9LFgHQZT8NXpuyJtQ6sUqc9glK9mn65RILz+2GL/PwCpEmDPJF0j4C/
 RS9znF5Lfu6gpHFr/VXYNdpbojrZjpyu5/vk+egFVnMOs3TaN/HpI/fXW9iqUDityhv1yjd0Cpu
 e7q89qXNtYHai+f9Kj2rqhz/+d6GNR58VWbnBJyeDqc1ofVCUyJ1d+VZd3tMyskS83jLvxpfwF1
 96CmvCzrAWOY7njdOBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 8b2a3be3fa932..7ae2c70eb5414 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2539,3 +2539,6 @@ EXPORT_SYMBOL_GPL(setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index d9d6cbda46b2c..58cbb399bc3b2 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.54.0

