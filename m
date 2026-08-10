Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7BDD40D582;
	Mon, 10 Aug 2026 15:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374918; cv=fail; b=oV2eayorRbSvhrE88TdSFDuaDwnZC9Ugwr0iy8yFYMffp6/GxU0yp3Q0ZjgpzTcvLaMkMRzCgDFvG1fZTnEsR+z4yHr4+tfZFWgMMmkTDZzqTDz68A/ETi0W2adh5KM2BTe+ft6/lGV24czriRLwW2cVqO2YrvqE491xnDn+izI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374918; c=relaxed/simple;
	bh=BysSqcxj5KrKaZctqiwMGkRiZNnMfxF3BwUonBFZUB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ak5OHKCzka6B75GbEmCJVEVD4ymVcMHlOG952FzhlWKrP/wTBzAuR2/TOMJSs137YeXUrWZapsaqDoJnQduwr/Bj/9T2QKZ77YLrNNWACYgKLM7A9nGERoHjo4gqa2InEibaXSzqjVk3VyZqnV6nRIJUR32cIAo8fmQ0TmKrOUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=nkbr0rAy; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=uYmXXQhT; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="nkbr0rAy";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="uYmXXQhT"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUYxI2888574;
	Mon, 10 Aug 2026 10:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=wC3wgUj57hvggG2aJf/KKesZvcbyoia/EH194oqD/
	2g=; b=nkbr0rAyDYteBRyZCzabz7RuWl7fYCMgLkhIxvbMAlLn/V95FMsXD65jW
	mO6ehQnsfBjZs3vpLXmQPVbWGMcExxKWf4WYQmfTV9458zpxU7MaVWvda8umRjcL
	P5r58iSrArcwoI5fn1jorj43KcKxbOrPaUPpvwCYvz37EMvVJil71GiVo04wywMq
	vynP+OW6O4j3cuXVizE+6vRxWzWHgIBjANT63Sh/VC1VYaLhRUDaYJ6JM1YGw67e
	2KzgUqhiuSjn7TIhbpebcFX0Ne81/j4kgr2rwGkPhFsnVXG5fMLBB26LX25hkwsQ
	p8n8haT8IM2q9VkXUfknX1bYr8okA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013036.outbound.protection.outlook.com [40.93.196.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmsh2f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRgFYE+gx6Qk+7g39ukwhDnoa/njlxND6zCN5xkg7XguZ0R1AHv4gtr7f77K9SRvRCo1kSxoeLgFVwpKrR6KSd3Ha6gFmE81zG9AZHf0yMa+59GW2FLMXIus/hEEIfNx9LDW2vjNadBaPMd8wjv3pRhS6guXxrCZxw5VvyLk1pTt9C3MB6OCvmXn6JAbPLkNblQotpYxHzHhiEUOZYcAHg8y7aOAROebo+J6EwjFqo3yW9hmvm7QfJwbwfYMoLK8jKt5I+Ks1BA3Ic3IdfNDN3qiM3KohSr1K4Yn3LU/WxndG7zAbzG+YYsOh0F25ugO0timWFSUFmdlI83lkeRj5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wC3wgUj57hvggG2aJf/KKesZvcbyoia/EH194oqD/2g=;
 b=EdGM+0RvFGtVu5vfIF30rHm/QM8a1qdOWR+T7nnI7kYipbPOeVdtJny+fWEEyLsRe78i1idZKiZMNuMK0wgF7o90v/v8AYeCyWl8e8Ydr21+YJkkf+2Bqu3aB4BW7sibaiMqfXP4Glxwpht6l2WmaPBo/9ZbOrpg1J+RDO04ZvMMRSrfl7xBV7qVB4tyYG7BK1rpuOB2BiCqamndmfz9u2/UcjNStYnb7AqGWDPxwgTwfiV6wWRr4tcCZKsy72oTPQ+cNu1dcV9IMmzU2nz5GChMs7WehFGOSRTLhIFiyj/jVDNNtP887KLs+jreM74vQX95Jm+L30HhCB9tkSTzRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wC3wgUj57hvggG2aJf/KKesZvcbyoia/EH194oqD/2g=;
 b=uYmXXQhTB2oGwEc0SIbaODEiRI1fIgPjOamaL8uen5EaD2RjoGheMAtbKimQeliI9Ox/EfRYdvw26w3IJIQzeiE+jrbTggjEE5QdX77PSMhfR38t7dI4Eg9PzBhHumUX68+T7RzZOzZcPU6o04UcAPxPt71WGBeHyYu8EOEZQmc=
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by SJ2PR10MB6991.namprd10.prod.outlook.com (2603:10b6:a03:4ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:14:55 +0000
Received: from SJ5PEPF000001CF.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::9d) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CF.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:55 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:54 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:54 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW02648613;
	Mon, 10 Aug 2026 10:14:50 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 05/19] dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c
Date: Mon, 10 Aug 2026 20:43:59 +0530
Message-ID: <20260810151423.1948224-6-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810151423.1948224-1-s-adivi@ti.com>
References: <20260810151423.1948224-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CF:EE_|SJ2PR10MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: a25886b7-3100-43fc-40cf-08def6f2224f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|921020|10063799003|13003099007|22082099003|18002099003|56012099006|10067099003|3023799007|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info:
	7jE4DspC3du82WuQ4SiMH5xsjGWa4Wzv3SUrjX+oU+V7ISL7fGB7Ery2ybTXfO3fulcKfTD/Hgg2sk+8hjoTOFkL1vMc0Oo9UC7kfwopGyx+HdmohwkyC1NW34IwIE9qqIJqXA7KfWoO5UlIGvI57wO+f/WU1rDUSbYmVHqbeZWOtMj3F7KfU/il4TAQYRujOZPSYPWU/qbQYMZsfR8Wv1UBT0DbFTH244/hvXUwBVDpz1LgCt225hr+EDK8Nwf8qN4JoJr/9kyBwy6aJg6XfmvQtpvOu93ybSDRzemy5UZgwcrDeE/GYrvNsp62Ucyd/WshgQ2ZNocOkOvYCQjJVW0Q1c13WvKVVgJU0CoYA2pP8S+Gya65Uw1YdP8OQCq+t/3Ddke3WnmIbA10MpRI5hmGMezhsH2qOb+CGUCkyREd1CNwfBTC3LQ+baLNDy6lfDADyO4i0RdR4UiwB8RoyZJ+ssN/61L45YEyqIlzb+1wjue98gu8ew1MP814tz3+ejhfmAOU9nF7D0MdRgj75CF5di2IsHfflCmYVaGs9ph2mij185xvNdpcqFsNes/+55/YaSCEMIsrqtkkTfbJ3zuxQeVGXVtNWq9ntNhPcpTgA8iA9a1+ebQD+HzUEis4ugEgnf2mK8cPwpF+0NPRQf5n/TEzintxGSjAGs59V1odreT4QAZroJaW0vP5sBde
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(10063799003)(13003099007)(22082099003)(18002099003)(56012099006)(10067099003)(3023799007)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z33/k3QiMj6OwDGnNkcWZSGi7u3gUkZiIbjibEaDu4ot1S48CS6Kf1v4CJXZGaWERf20Ah1k/sZtjnpPGmnG1gkZHUhGcaO+Q8QQ5sxLjtjzHSe1szVl0YJJATOetWT92n10KjF88nzwDXJJLdB8y73acDHbHY3EkyAjQvkc7NzYVja1OJKkxsOtHpJx6sLIlJ9lM46m/rgH4zfwXQrdiaSSSNcREzI/PVnbvTO9ZVcxt7FYXHaKcq4zae9RArTOfXTOb/Ic+fxpAW75V5aM1eDDt/mO6WpxujjDxgjp7CnDNkZCywYjQpOvJr+DdKkaddt/Ch9g9eTLD4so+/pSZbqupEcIQNnjba9O0XnH/ANJT2KgbuJPVQvr2MU0soBMbTUIHjv+CbNiHXkZBG3TFYLnHIU+UX06IBAJPn32UQIphi+AcoGEoEG0XiDf8yJi
X-Exchange-RoutingPolicyChecked:
	V71Zb9h/6lg6PfpEyR/pF7DQV8qrXZzPnflDK/a0PuQUt9+Kr8vraSSdD9OCUWzxqXKFQXsgDGc7IepPDWbXIilciuU7cRn6aZEa1VoiiApr52c8b69ae9N0QWnemMLpuSJAWIVb4gkj8qMeRr6tZHEe45MI8hie+GyEd0YVD8nHuDRmz10789Yvny64iO6Ha40yoCKy29JQpjs82OhjPA5abaQP2NSxrngilpCUBOFFyDRYDFiz6hISsGMZmsrX/2k3+VBmjZP4Oxhu2UcLedPFnMX5+04WW6H5pX8OqAhe6T7TX91iXiDhOUPCqA+G9+CCEp50Y74d7Jj08P9QjQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:55.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a25886b7-3100-43fc-40cf-08def6f2224f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6991
X-Proofpoint-GUID: b5l-qWRp_4VWRHAHXXAKcCegB8sVBMdU
X-Proofpoint-ORIG-GUID: b5l-qWRp_4VWRHAHXXAKcCegB8sVBMdU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX+3UV2j514koV
 TnfrIIxpAmiFxXapxJIgGiD4nj+nCa4GwwOXkpzql6UVEcDUwu1yqPZACxQfKZKF9f7KuzojA7G
 fv4HsfCuDvzkoBtv15DYUM4KfYNNv3VITVaHL2LhR+fOUjvmXRXwHEndJEA8jbAIZ4pYyM1lxQ/
 8ZkYMHJAkpb5KsejqbTMnd9rhx//d6tOj/PcdG9/fKDZZCp4msFKFRhQ3UMsDGCfiwIFk5ZIMOR
 CERlS28BhFR4VD4HGSi9iKJFHWJnrtFy72I4JZZ8mO5CFVr1ffL3zy33KkguCISpAU1ONlNTtFg
 ZR0upKS2OoQuu8yQg2GTiooGzYGR/x+3e3tIOfl0gSvxCOsY7gVK4lKsKWywm5Qx/ZxLDwX4/qj
 XtfepnEfa+xUM2UVvIkcJSoLo5zfpxTvqWMQsyyl/oDSyneWQGP1uno5VGsPBrsRQRLUvFo5SQe
 vCF7wCIbd8/lHx6ZbkA==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a79eaf4 cx=c_pps
 a=vqIpJ22NDJOYTIB/W/KhXg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=9fA4dagTuIDSJ7NYoQoA:9
 a=x_a8ZKo73Tz1WADx:21
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX3A4y+Ir3/4PE
 1E42Y873ylPOgXgiyRpY6mzvHH3IBa2jK69QSDjaqD3yAlfwtGVovR3o4mqTRKK8a4bIWQoPwOi
 Dh6d3L/z1+L2bENG7bhALuui/qQbruc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Refactor the K3 UDMA driver by moving all DMA descriptor handling
functions from k3-udma.c to a new common library, k3-udma-common.c.

This prepares the driver for supporting new K3 UDMA v2 variant
(used in AM62L) that can reuse the same descriptor handling logic.

To ensure this common code works correctly across all build
configurations (built-in vs modules), introduce a hidden Kconfig symbol:
CONFIG_TI_K3_UDMA_COMMON.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Kconfig          |    5 +
 drivers/dma/ti/Makefile         |    1 +
 drivers/dma/ti/k3-udma-common.c | 1243 +++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c        | 1218 ------------------------------
 drivers/dma/ti/k3-udma.h        |   54 ++
 5 files changed, 1303 insertions(+), 1218 deletions(-)
 create mode 100644 drivers/dma/ti/k3-udma-common.c

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index cbc30ab627832..712e456015459 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -42,12 +42,17 @@ config TI_K3_UDMA
 	select DMA_ENGINE
 	select DMA_VIRTUAL_CHANNELS
 	select SOC_TI
+	select TI_K3_UDMA_COMMON
 	select TI_K3_RINGACC
 	select TI_K3_PSIL
         help
 	  Enable support for the TI UDMA (Unified DMA) controller. This
 	  DMA engine is used in AM65x and j721e.
 
+config TI_K3_UDMA_COMMON
+	tristate
+	default n
+
 config TI_K3_UDMA_GLUE_LAYER
 	tristate "Texas Instruments UDMA Glue layer for non DMAengine users"
 	depends on ARCH_K3 || COMPILE_TEST
diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index d376c117cecf6..3b91c02e55eaf 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_TI_CPPI41) += cppi41.o
 obj-$(CONFIG_TI_EDMA) += edma.o
 obj-$(CONFIG_DMA_OMAP) += omap-dma.o
 obj-$(CONFIG_TI_K3_UDMA) += k3-udma.o
+obj-$(CONFIG_TI_K3_UDMA_COMMON) += k3-udma-common.o
 obj-$(CONFIG_TI_K3_UDMA_GLUE_LAYER) += k3-udma-glue.o
 k3-psil-lib-objs := k3-psil.o \
 		    k3-psil-am654.o \
diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
new file mode 100644
index 0000000000000..3130805a8ec40
--- /dev/null
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -0,0 +1,1243 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2025 Texas Instruments Incorporated - http://www.ti.com
+ *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+ */
+
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
+#include <linux/platform_device.h>
+#include <linux/soc/ti/k3-ringacc.h>
+
+#include "k3-udma.h"
+
+static const struct dma_descriptor_metadata_ops metadata_ops = {
+	.attach = udma_attach_metadata,
+	.get_ptr = udma_get_metadata_ptr,
+	.set_len = udma_set_metadata_len,
+};
+
+struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
+					    dma_addr_t paddr)
+{
+	struct udma_desc *d = uc->terminated_desc;
+
+	if (d) {
+		dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
+								   d->desc_idx);
+
+		if (desc_paddr != paddr)
+			d = NULL;
+	}
+
+	if (!d) {
+		d = uc->desc;
+		if (d) {
+			dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
+									   d->desc_idx);
+
+			if (desc_paddr != paddr)
+				d = NULL;
+		}
+	}
+
+	return d;
+}
+EXPORT_SYMBOL_GPL(udma_udma_desc_from_paddr);
+
+void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
+{
+	if (uc->use_dma_pool) {
+		int i;
+
+		for (i = 0; i < d->hwdesc_count; i++) {
+			if (!d->hwdesc[i].cppi5_desc_vaddr)
+				continue;
+
+			dma_pool_free(uc->hdesc_pool,
+				      d->hwdesc[i].cppi5_desc_vaddr,
+				      d->hwdesc[i].cppi5_desc_paddr);
+
+			d->hwdesc[i].cppi5_desc_vaddr = NULL;
+		}
+	} else if (d->hwdesc[0].cppi5_desc_vaddr) {
+		dma_free_coherent(uc->dma_dev, d->hwdesc[0].cppi5_desc_size,
+				  d->hwdesc[0].cppi5_desc_vaddr,
+				  d->hwdesc[0].cppi5_desc_paddr);
+
+		d->hwdesc[0].cppi5_desc_vaddr = NULL;
+	}
+}
+
+void udma_purge_desc_work(struct work_struct *work)
+{
+	struct udma_dev *ud = container_of(work, typeof(*ud), purge_work);
+	struct virt_dma_desc *vd, *_vd;
+	unsigned long flags;
+	LIST_HEAD(head);
+
+	spin_lock_irqsave(&ud->lock, flags);
+	list_splice_tail_init(&ud->desc_to_purge, &head);
+	spin_unlock_irqrestore(&ud->lock, flags);
+
+	list_for_each_entry_safe(vd, _vd, &head, node) {
+		struct udma_chan *uc = to_udma_chan(vd->tx.chan);
+		struct udma_desc *d = to_udma_desc(&vd->tx);
+
+		udma_free_hwdesc(uc, d);
+		list_del(&vd->node);
+		kfree(d);
+	}
+
+	/* If more to purge, schedule the work again */
+	if (!list_empty(&ud->desc_to_purge))
+		schedule_work(&ud->purge_work);
+}
+EXPORT_SYMBOL_GPL(udma_purge_desc_work);
+
+void udma_desc_free(struct virt_dma_desc *vd)
+{
+	struct udma_dev *ud = to_udma_dev(vd->tx.chan->device);
+	struct udma_chan *uc = to_udma_chan(vd->tx.chan);
+	struct udma_desc *d = to_udma_desc(&vd->tx);
+	unsigned long flags;
+
+	if (uc->terminated_desc == d)
+		uc->terminated_desc = NULL;
+
+	if (uc->use_dma_pool) {
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return;
+	}
+
+	spin_lock_irqsave(&ud->lock, flags);
+	list_add_tail(&vd->node, &ud->desc_to_purge);
+	spin_unlock_irqrestore(&ud->lock, flags);
+
+	schedule_work(&ud->purge_work);
+}
+EXPORT_SYMBOL_GPL(udma_desc_free);
+
+bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
+{
+	if (uc->config.dir != DMA_DEV_TO_MEM)
+		return false;
+
+	if (addr == udma_get_rx_flush_hwdesc_paddr(uc))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(udma_desc_is_rx_flush);
+
+bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
+{
+	u32 peer_bcnt, bcnt;
+
+	/*
+	 * Only TX towards PDMA is affected.
+	 * If DMA_PREP_INTERRUPT is not set by consumer then skip the transfer
+	 * completion calculation, consumer must ensure that there is no stale
+	 * data in DMA fabric in this case.
+	 */
+	if (uc->config.ep_type == PSIL_EP_NATIVE ||
+	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
+		return true;
+
+	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
+	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+
+	/* Transfer is incomplete, store current residue and time stamp */
+	if (peer_bcnt < bcnt) {
+		uc->tx_drain.residue = bcnt - peer_bcnt;
+		uc->tx_drain.tstamp = ktime_get();
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(udma_is_desc_really_done);
+
+struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
+				     size_t tr_size, int tr_count,
+				     enum dma_transfer_direction dir)
+{
+	struct udma_hwdesc *hwdesc;
+	struct cppi5_desc_hdr_t *tr_desc;
+	struct udma_desc *d;
+	u32 reload_count = 0;
+	u32 ring_id;
+
+	switch (tr_size) {
+	case 16:
+	case 32:
+	case 64:
+	case 128:
+		break;
+	default:
+		dev_err(uc->ud->dev, "Unsupported TR size of %zu\n", tr_size);
+		return NULL;
+	}
+
+	/* We have only one descriptor containing multiple TRs */
+	d = kzalloc(sizeof(*d) + sizeof(d->hwdesc[0]), GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->sglen = tr_count;
+
+	d->hwdesc_count = 1;
+	hwdesc = &d->hwdesc[0];
+
+	/* Allocate memory for DMA ring descriptor */
+	if (uc->use_dma_pool) {
+		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
+		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
+							   GFP_NOWAIT,
+							   &hwdesc->cppi5_desc_paddr);
+	} else {
+		hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size,
+								 tr_count);
+		hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
+						uc->ud->desc_align);
+		hwdesc->cppi5_desc_vaddr = dma_alloc_coherent(uc->ud->dev,
+							      hwdesc->cppi5_desc_size,
+							      &hwdesc->cppi5_desc_paddr,
+							      GFP_NOWAIT);
+	}
+
+	if (!hwdesc->cppi5_desc_vaddr) {
+		kfree(d);
+		return NULL;
+	}
+
+	/* Start of the TR req records */
+	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
+	/* Start address of the TR response array */
+	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size * tr_count;
+
+	tr_desc = hwdesc->cppi5_desc_vaddr;
+
+	if (uc->cyclic)
+		reload_count = CPPI5_INFO0_TRDESC_RLDCNT_INFINITE;
+
+	if (dir == DMA_DEV_TO_MEM)
+		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
+	else
+		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
+
+	cppi5_trdesc_init(tr_desc, tr_count, tr_size, 0, reload_count);
+	cppi5_desc_set_pktids(tr_desc, uc->id,
+			      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+	cppi5_desc_set_retpolicy(tr_desc, 0, ring_id);
+
+	return d;
+}
+
+/**
+ * udma_get_tr_counters - calculate TR counters for a given length
+ * @len: Length of the transfer
+ * @align_to: Preferred alignment
+ * @tr0_cnt0: First TR icnt0
+ * @tr0_cnt1: First TR icnt1
+ * @tr1_cnt0: Second (if used) TR icnt0
+ *
+ * For len < SZ_64K only one TR is enough, tr1_cnt0 is not updated
+ * For len >= SZ_64K two TRs are used in a simple way:
+ * First TR: SZ_64K-alignment blocks (tr0_cnt0, tr0_cnt1)
+ * Second TR: the remaining length (tr1_cnt0)
+ *
+ * Returns the number of TRs the length needs (1 or 2)
+ * -EINVAL if the length can not be supported
+ */
+int udma_get_tr_counters(size_t len, unsigned long align_to,
+			 u16 *tr0_cnt0, u16 *tr0_cnt1, u16 *tr1_cnt0)
+{
+	if (len < SZ_64K) {
+		*tr0_cnt0 = len;
+		*tr0_cnt1 = 1;
+
+		return 1;
+	}
+
+	if (align_to > 3)
+		align_to = 3;
+
+realign:
+	*tr0_cnt0 = SZ_64K - BIT(align_to);
+	if (len / *tr0_cnt0 >= SZ_64K) {
+		if (align_to) {
+			align_to--;
+			goto realign;
+		}
+		return -EINVAL;
+	}
+
+	*tr0_cnt1 = len / *tr0_cnt0;
+	*tr1_cnt0 = len % *tr0_cnt0;
+
+	return 2;
+}
+
+struct udma_desc *
+udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
+		      unsigned int sglen, enum dma_transfer_direction dir,
+		      unsigned long tx_flags, void *context)
+{
+	struct scatterlist *sgent;
+	struct udma_desc *d;
+	struct cppi5_tr_type1_t *tr_req = NULL;
+	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
+	unsigned int i;
+	size_t tr_size;
+	int num_tr = 0;
+	int tr_idx = 0;
+	u64 asel;
+
+	/* estimate the number of TRs we will need */
+	for_each_sg(sgl, sgent, sglen, i) {
+		if (sg_dma_len(sgent) < SZ_64K)
+			num_tr++;
+		else
+			num_tr += 2;
+	}
+
+	/* Now allocate and setup the descriptor. */
+	tr_size = sizeof(struct cppi5_tr_type1_t);
+	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
+	if (!d)
+		return NULL;
+
+	d->sglen = sglen;
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
+		asel = 0;
+	else
+		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+
+	tr_req = d->hwdesc[0].tr_req_base;
+	for_each_sg(sgl, sgent, sglen, i) {
+		dma_addr_t sg_addr = sg_dma_address(sgent);
+
+		num_tr = udma_get_tr_counters(sg_dma_len(sgent), __ffs(sg_addr),
+					      &tr0_cnt0, &tr0_cnt1, &tr1_cnt0);
+		if (num_tr < 0) {
+			dev_err(uc->ud->dev, "size %u is not supported\n",
+				sg_dma_len(sgent));
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
+			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
+
+		sg_addr |= asel;
+		tr_req[tr_idx].addr = sg_addr;
+		tr_req[tr_idx].icnt0 = tr0_cnt0;
+		tr_req[tr_idx].icnt1 = tr0_cnt1;
+		tr_req[tr_idx].dim1 = tr0_cnt0;
+		tr_idx++;
+
+		if (num_tr == 2) {
+			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
+				      false, false,
+				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
+					 CPPI5_TR_CSF_SUPR_EVT);
+
+			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
+			tr_req[tr_idx].icnt0 = tr1_cnt0;
+			tr_req[tr_idx].icnt1 = 1;
+			tr_req[tr_idx].dim1 = tr1_cnt0;
+			tr_idx++;
+		}
+
+		d->residue += sg_dma_len(sgent);
+	}
+
+	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags,
+			 CPPI5_TR_CSF_SUPR_EVT | CPPI5_TR_CSF_EOP);
+
+	return d;
+}
+
+struct udma_desc *
+udma_prep_slave_sg_triggered_tr(struct udma_chan *uc, struct scatterlist *sgl,
+				unsigned int sglen,
+				enum dma_transfer_direction dir,
+				unsigned long tx_flags, void *context)
+{
+	struct scatterlist *sgent;
+	struct cppi5_tr_type15_t *tr_req = NULL;
+	enum dma_slave_buswidth dev_width;
+	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
+	u16 tr_cnt0, tr_cnt1;
+	dma_addr_t dev_addr;
+	struct udma_desc *d;
+	unsigned int i;
+	size_t tr_size, sg_len;
+	int num_tr = 0;
+	int tr_idx = 0;
+	u32 burst, trigger_size, port_window;
+	u64 asel;
+
+	if (dir == DMA_DEV_TO_MEM) {
+		dev_addr = uc->cfg.src_addr;
+		dev_width = uc->cfg.src_addr_width;
+		burst = uc->cfg.src_maxburst;
+		port_window = uc->cfg.src_port_window_size;
+	} else if (dir == DMA_MEM_TO_DEV) {
+		dev_addr = uc->cfg.dst_addr;
+		dev_width = uc->cfg.dst_addr_width;
+		burst = uc->cfg.dst_maxburst;
+		port_window = uc->cfg.dst_port_window_size;
+	} else {
+		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
+		return NULL;
+	}
+
+	if (!burst)
+		burst = 1;
+
+	if (port_window) {
+		if (port_window != burst) {
+			dev_err(uc->ud->dev,
+				"The burst must be equal to port_window\n");
+			return NULL;
+		}
+
+		tr_cnt0 = dev_width * port_window;
+		tr_cnt1 = 1;
+	} else {
+		tr_cnt0 = dev_width;
+		tr_cnt1 = burst;
+	}
+	trigger_size = tr_cnt0 * tr_cnt1;
+
+	/* estimate the number of TRs we will need */
+	for_each_sg(sgl, sgent, sglen, i) {
+		sg_len = sg_dma_len(sgent);
+
+		if (sg_len % trigger_size) {
+			dev_err(uc->ud->dev,
+				"Not aligned SG entry (%zu for %u)\n", sg_len,
+				trigger_size);
+			return NULL;
+		}
+
+		if (sg_len / trigger_size < SZ_64K)
+			num_tr++;
+		else
+			num_tr += 2;
+	}
+
+	/* Now allocate and setup the descriptor. */
+	tr_size = sizeof(struct cppi5_tr_type15_t);
+	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
+	if (!d)
+		return NULL;
+
+	d->sglen = sglen;
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA) {
+		asel = 0;
+		csf |= CPPI5_TR_CSF_EOL_ICNT0;
+	} else {
+		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+		dev_addr |= asel;
+	}
+
+	tr_req = d->hwdesc[0].tr_req_base;
+	for_each_sg(sgl, sgent, sglen, i) {
+		u16 tr0_cnt2, tr0_cnt3, tr1_cnt2;
+		dma_addr_t sg_addr = sg_dma_address(sgent);
+
+		sg_len = sg_dma_len(sgent);
+		num_tr = udma_get_tr_counters(sg_len / trigger_size, 0,
+					      &tr0_cnt2, &tr0_cnt3, &tr1_cnt2);
+		if (num_tr < 0) {
+			dev_err(uc->ud->dev, "size %zu is not supported\n",
+				sg_len);
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15, false,
+			      true, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+		cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
+		cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
+				     uc->config.tr_trigger_type,
+				     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC, 0, 0);
+
+		sg_addr |= asel;
+		if (dir == DMA_DEV_TO_MEM) {
+			tr_req[tr_idx].addr = dev_addr;
+			tr_req[tr_idx].icnt0 = tr_cnt0;
+			tr_req[tr_idx].icnt1 = tr_cnt1;
+			tr_req[tr_idx].icnt2 = tr0_cnt2;
+			tr_req[tr_idx].icnt3 = tr0_cnt3;
+			tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
+
+			tr_req[tr_idx].daddr = sg_addr;
+			tr_req[tr_idx].dicnt0 = tr_cnt0;
+			tr_req[tr_idx].dicnt1 = tr_cnt1;
+			tr_req[tr_idx].dicnt2 = tr0_cnt2;
+			tr_req[tr_idx].dicnt3 = tr0_cnt3;
+			tr_req[tr_idx].ddim1 = tr_cnt0;
+			tr_req[tr_idx].ddim2 = trigger_size;
+			tr_req[tr_idx].ddim3 = trigger_size * tr0_cnt2;
+		} else {
+			tr_req[tr_idx].addr = sg_addr;
+			tr_req[tr_idx].icnt0 = tr_cnt0;
+			tr_req[tr_idx].icnt1 = tr_cnt1;
+			tr_req[tr_idx].icnt2 = tr0_cnt2;
+			tr_req[tr_idx].icnt3 = tr0_cnt3;
+			tr_req[tr_idx].dim1 = tr_cnt0;
+			tr_req[tr_idx].dim2 = trigger_size;
+			tr_req[tr_idx].dim3 = trigger_size * tr0_cnt2;
+
+			tr_req[tr_idx].daddr = dev_addr;
+			tr_req[tr_idx].dicnt0 = tr_cnt0;
+			tr_req[tr_idx].dicnt1 = tr_cnt1;
+			tr_req[tr_idx].dicnt2 = tr0_cnt2;
+			tr_req[tr_idx].dicnt3 = tr0_cnt3;
+			tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
+		}
+
+		tr_idx++;
+
+		if (num_tr == 2) {
+			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15,
+				      false, true,
+				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
+			cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
+					     uc->config.tr_trigger_type,
+					     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC,
+					     0, 0);
+
+			sg_addr += trigger_size * tr0_cnt2 * tr0_cnt3;
+			if (dir == DMA_DEV_TO_MEM) {
+				tr_req[tr_idx].addr = dev_addr;
+				tr_req[tr_idx].icnt0 = tr_cnt0;
+				tr_req[tr_idx].icnt1 = tr_cnt1;
+				tr_req[tr_idx].icnt2 = tr1_cnt2;
+				tr_req[tr_idx].icnt3 = 1;
+				tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
+
+				tr_req[tr_idx].daddr = sg_addr;
+				tr_req[tr_idx].dicnt0 = tr_cnt0;
+				tr_req[tr_idx].dicnt1 = tr_cnt1;
+				tr_req[tr_idx].dicnt2 = tr1_cnt2;
+				tr_req[tr_idx].dicnt3 = 1;
+				tr_req[tr_idx].ddim1 = tr_cnt0;
+				tr_req[tr_idx].ddim2 = trigger_size;
+			} else {
+				tr_req[tr_idx].addr = sg_addr;
+				tr_req[tr_idx].icnt0 = tr_cnt0;
+				tr_req[tr_idx].icnt1 = tr_cnt1;
+				tr_req[tr_idx].icnt2 = tr1_cnt2;
+				tr_req[tr_idx].icnt3 = 1;
+				tr_req[tr_idx].dim1 = tr_cnt0;
+				tr_req[tr_idx].dim2 = trigger_size;
+
+				tr_req[tr_idx].daddr = dev_addr;
+				tr_req[tr_idx].dicnt0 = tr_cnt0;
+				tr_req[tr_idx].dicnt1 = tr_cnt1;
+				tr_req[tr_idx].dicnt2 = tr1_cnt2;
+				tr_req[tr_idx].dicnt3 = 1;
+				tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
+			}
+			tr_idx++;
+		}
+
+		d->residue += sg_len;
+	}
+
+	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags, csf | CPPI5_TR_CSF_EOP);
+
+	return d;
+}
+
+int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
+			    enum dma_slave_buswidth dev_width,
+			    u16 elcnt)
+{
+	if (uc->config.ep_type != PSIL_EP_PDMA_XY)
+		return 0;
+
+	/* Bus width translates to the element size (ES) */
+	switch (dev_width) {
+	case DMA_SLAVE_BUSWIDTH_1_BYTE:
+		d->static_tr.elsize = 0;
+		break;
+	case DMA_SLAVE_BUSWIDTH_2_BYTES:
+		d->static_tr.elsize = 1;
+		break;
+	case DMA_SLAVE_BUSWIDTH_3_BYTES:
+		d->static_tr.elsize = 2;
+		break;
+	case DMA_SLAVE_BUSWIDTH_4_BYTES:
+		d->static_tr.elsize = 3;
+		break;
+	case DMA_SLAVE_BUSWIDTH_8_BYTES:
+		d->static_tr.elsize = 4;
+		break;
+	default: /* not reached */
+		return -EINVAL;
+	}
+
+	d->static_tr.elcnt = elcnt;
+
+	if (uc->config.pkt_mode || !uc->cyclic) {
+		/*
+		 * PDMA must close the packet when the channel is in packet mode.
+		 * For TR mode when the channel is not cyclic we also need PDMA
+		 * to close the packet otherwise the transfer will stall because
+		 * PDMA holds on the data it has received from the peripheral.
+		 */
+		unsigned int div = dev_width * elcnt;
+
+		if (uc->cyclic)
+			d->static_tr.bstcnt = d->residue / d->sglen / div;
+		else
+			d->static_tr.bstcnt = d->residue / div;
+	} else if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
+		   uc->config.dir == DMA_DEV_TO_MEM &&
+		   uc->cyclic) {
+		/*
+		 * For cyclic mode with BCDMA we have to set EOP in each TR to
+		 * prevent short packet errors seen on channel teardown. So the
+		 * PDMA must close the packet after every TR transfer by setting
+		 * burst count equal to the number of bytes transferred.
+		 */
+		struct cppi5_tr_type1_t *tr_req = d->hwdesc[0].tr_req_base;
+
+		d->static_tr.bstcnt =
+			(tr_req->icnt0 * tr_req->icnt1) / dev_width;
+	} else {
+		d->static_tr.bstcnt = 0;
+	}
+
+	if (uc->config.dir == DMA_DEV_TO_MEM &&
+	    d->static_tr.bstcnt > uc->ud->match_data->statictr_z_mask)
+		return -EINVAL;
+
+	return 0;
+}
+
+struct udma_desc *
+udma_prep_slave_sg_pkt(struct udma_chan *uc, struct scatterlist *sgl,
+		       unsigned int sglen, enum dma_transfer_direction dir,
+		       unsigned long tx_flags, void *context)
+{
+	struct scatterlist *sgent;
+	struct cppi5_host_desc_t *h_desc = NULL;
+	struct udma_desc *d;
+	u32 ring_id;
+	unsigned int i;
+	u64 asel;
+
+	d = kzalloc(struct_size(d, hwdesc, sglen), GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->sglen = sglen;
+	d->hwdesc_count = sglen;
+
+	if (dir == DMA_DEV_TO_MEM)
+		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
+	else
+		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
+
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
+		asel = 0;
+	else
+		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+
+	for_each_sg(sgl, sgent, sglen, i) {
+		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
+		dma_addr_t sg_addr = sg_dma_address(sgent);
+		struct cppi5_host_desc_t *desc;
+		size_t sg_len = sg_dma_len(sgent);
+
+		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
+							   GFP_NOWAIT,
+							   &hwdesc->cppi5_desc_paddr);
+		if (!hwdesc->cppi5_desc_vaddr) {
+			dev_err(uc->ud->dev,
+				"descriptor%d allocation failed\n", i);
+
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		d->residue += sg_len;
+		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
+		desc = hwdesc->cppi5_desc_vaddr;
+
+		if (i == 0) {
+			cppi5_hdesc_init(desc, 0, 0);
+			/* Flow and Packed ID */
+			cppi5_desc_set_pktids(&desc->hdr, uc->id,
+					      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+			cppi5_desc_set_retpolicy(&desc->hdr, 0, ring_id);
+		} else {
+			cppi5_hdesc_reset_hbdesc(desc);
+			cppi5_desc_set_retpolicy(&desc->hdr, 0, 0xffff);
+		}
+
+		/* attach the sg buffer to the descriptor */
+		sg_addr |= asel;
+		cppi5_hdesc_attach_buf(desc, sg_addr, sg_len, sg_addr, sg_len);
+
+		/* Attach link as host buffer descriptor */
+		if (h_desc)
+			cppi5_hdesc_link_hbdesc(h_desc,
+						hwdesc->cppi5_desc_paddr | asel);
+
+		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA ||
+		    dir == DMA_MEM_TO_DEV)
+			h_desc = desc;
+	}
+
+	if (d->residue >= SZ_4M) {
+		dev_err(uc->ud->dev,
+			"%s: Transfer size %u is over the supported 4M range\n",
+			__func__, d->residue);
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return NULL;
+	}
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+	cppi5_hdesc_set_pktlen(h_desc, d->residue);
+
+	return d;
+}
+
+int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+			 void *data, size_t len)
+{
+	struct udma_desc *d = to_udma_desc(desc);
+	struct udma_chan *uc = to_udma_chan(desc->chan);
+	struct cppi5_host_desc_t *h_desc;
+	u32 psd_size = len;
+	u32 flags = 0;
+
+	if (!uc->config.pkt_mode || !uc->config.metadata_size)
+		return -EOPNOTSUPP;
+
+	if (!data || len > uc->config.metadata_size)
+		return -EINVAL;
+
+	if (uc->config.needs_epib && len < CPPI5_INFO0_HDESC_EPIB_SIZE)
+		return -EINVAL;
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+	if (d->dir == DMA_MEM_TO_DEV)
+		memcpy(h_desc->epib, data, len);
+
+	if (uc->config.needs_epib)
+		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
+
+	d->metadata = data;
+	d->metadata_size = len;
+	if (uc->config.needs_epib)
+		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
+
+	cppi5_hdesc_update_flags(h_desc, flags);
+	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
+
+	return 0;
+}
+
+void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+			    size_t *payload_len, size_t *max_len)
+{
+	struct udma_desc *d = to_udma_desc(desc);
+	struct udma_chan *uc = to_udma_chan(desc->chan);
+	struct cppi5_host_desc_t *h_desc;
+
+	if (!uc->config.pkt_mode || !uc->config.metadata_size)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	*max_len = uc->config.metadata_size;
+
+	*payload_len = cppi5_hdesc_epib_present(&h_desc->hdr) ?
+		       CPPI5_INFO0_HDESC_EPIB_SIZE : 0;
+	*payload_len += cppi5_hdesc_get_psdata_size(h_desc);
+
+	return h_desc->epib;
+}
+
+int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+			  size_t payload_len)
+{
+	struct udma_desc *d = to_udma_desc(desc);
+	struct udma_chan *uc = to_udma_chan(desc->chan);
+	struct cppi5_host_desc_t *h_desc;
+	u32 psd_size = payload_len;
+	u32 flags = 0;
+
+	if (!uc->config.pkt_mode || !uc->config.metadata_size)
+		return -EOPNOTSUPP;
+
+	if (payload_len > uc->config.metadata_size)
+		return -EINVAL;
+
+	if (uc->config.needs_epib && payload_len < CPPI5_INFO0_HDESC_EPIB_SIZE)
+		return -EINVAL;
+
+	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
+
+	if (uc->config.needs_epib) {
+		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
+		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
+	}
+
+	cppi5_hdesc_update_flags(h_desc, flags);
+	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
+
+	return 0;
+}
+
+struct dma_async_tx_descriptor *
+udma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
+		   unsigned int sglen, enum dma_transfer_direction dir,
+		   unsigned long tx_flags, void *context)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	enum dma_slave_buswidth dev_width;
+	struct udma_desc *d;
+	u32 burst;
+
+	if (dir != uc->config.dir &&
+	    (uc->config.dir == DMA_MEM_TO_MEM && !uc->config.tr_trigger_type)) {
+		dev_err(chan->device->dev,
+			"%s: chan%d is for %s, not supporting %s\n",
+			__func__, uc->id,
+			dmaengine_get_direction_text(uc->config.dir),
+			dmaengine_get_direction_text(dir));
+		return NULL;
+	}
+
+	if (dir == DMA_DEV_TO_MEM) {
+		dev_width = uc->cfg.src_addr_width;
+		burst = uc->cfg.src_maxburst;
+	} else if (dir == DMA_MEM_TO_DEV) {
+		dev_width = uc->cfg.dst_addr_width;
+		burst = uc->cfg.dst_maxburst;
+	} else {
+		dev_err(chan->device->dev, "%s: bad direction?\n", __func__);
+		return NULL;
+	}
+
+	if (!burst)
+		burst = 1;
+
+	uc->config.tx_flags = tx_flags;
+
+	if (uc->config.pkt_mode)
+		d = udma_prep_slave_sg_pkt(uc, sgl, sglen, dir, tx_flags,
+					   context);
+	else if (is_slave_direction(uc->config.dir))
+		d = udma_prep_slave_sg_tr(uc, sgl, sglen, dir, tx_flags,
+					  context);
+	else
+		d = udma_prep_slave_sg_triggered_tr(uc, sgl, sglen, dir,
+						    tx_flags, context);
+
+	if (!d)
+		return NULL;
+
+	d->dir = dir;
+	d->desc_idx = 0;
+	d->tr_idx = 0;
+
+	/* static TR for remote PDMA */
+	if (udma_configure_statictr(uc, d, dev_width, burst)) {
+		dev_err(uc->ud->dev,
+			"%s: StaticTR Z is limited to maximum %u (%u)\n",
+			__func__, uc->ud->match_data->statictr_z_mask,
+			d->static_tr.bstcnt);
+
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return NULL;
+	}
+
+	if (uc->config.metadata_size)
+		d->vd.tx.metadata_ops = &metadata_ops;
+
+	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
+}
+EXPORT_SYMBOL_GPL(udma_prep_slave_sg);
+
+struct udma_desc *
+udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
+			size_t buf_len, size_t period_len,
+			enum dma_transfer_direction dir, unsigned long flags)
+{
+	struct udma_desc *d;
+	size_t tr_size, period_addr;
+	struct cppi5_tr_type1_t *tr_req;
+	unsigned int periods = buf_len / period_len;
+	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
+	unsigned int i;
+	int num_tr;
+	u32 period_csf = 0;
+
+	num_tr = udma_get_tr_counters(period_len, __ffs(buf_addr), &tr0_cnt0,
+				      &tr0_cnt1, &tr1_cnt0);
+	if (num_tr < 0) {
+		dev_err(uc->ud->dev, "size %zu is not supported\n",
+			period_len);
+		return NULL;
+	}
+
+	/* Now allocate and setup the descriptor. */
+	tr_size = sizeof(struct cppi5_tr_type1_t);
+	d = udma_alloc_tr_desc(uc, tr_size, periods * num_tr, dir);
+	if (!d)
+		return NULL;
+
+	tr_req = d->hwdesc[0].tr_req_base;
+	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
+		period_addr = buf_addr;
+	else
+		period_addr = buf_addr |
+			((u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT);
+
+	/*
+	 * For BCDMA <-> PDMA transfers, the EOP flag needs to be set on the
+	 * last TR of a descriptor, to mark the packet as complete.
+	 * This is required for getting the teardown completion message in case
+	 * of TX, and to avoid short-packet error in case of RX.
+	 *
+	 * As we are in cyclic mode, we do not know which period might be the
+	 * last one, so set the flag for each period.
+	 */
+	if (uc->config.ep_type == PSIL_EP_PDMA_XY &&
+	    uc->ud->match_data->type == DMA_TYPE_BCDMA) {
+		period_csf = CPPI5_TR_CSF_EOP;
+	}
+
+	for (i = 0; i < periods; i++) {
+		int tr_idx = i * num_tr;
+
+		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
+			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+
+		tr_req[tr_idx].addr = period_addr;
+		tr_req[tr_idx].icnt0 = tr0_cnt0;
+		tr_req[tr_idx].icnt1 = tr0_cnt1;
+		tr_req[tr_idx].dim1 = tr0_cnt0;
+
+		if (num_tr == 2) {
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
+					 CPPI5_TR_CSF_SUPR_EVT);
+			tr_idx++;
+
+			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
+				      false, false,
+				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+
+			tr_req[tr_idx].addr = period_addr + tr0_cnt1 * tr0_cnt0;
+			tr_req[tr_idx].icnt0 = tr1_cnt0;
+			tr_req[tr_idx].icnt1 = 1;
+			tr_req[tr_idx].dim1 = tr1_cnt0;
+		}
+
+		if (!(flags & DMA_PREP_INTERRUPT))
+			period_csf |= CPPI5_TR_CSF_SUPR_EVT;
+
+		if (period_csf)
+			cppi5_tr_csf_set(&tr_req[tr_idx].flags, period_csf);
+
+		period_addr += period_len;
+	}
+
+	return d;
+}
+
+struct udma_desc *
+udma_prep_dma_cyclic_pkt(struct udma_chan *uc, dma_addr_t buf_addr,
+			 size_t buf_len, size_t period_len,
+			 enum dma_transfer_direction dir, unsigned long flags)
+{
+	struct udma_desc *d;
+	u32 ring_id;
+	int i;
+	int periods = buf_len / period_len;
+
+	if (periods > (K3_UDMA_DEFAULT_RING_SIZE - 1))
+		return NULL;
+
+	if (period_len >= SZ_4M)
+		return NULL;
+
+	d = kzalloc(struct_size(d, hwdesc, periods), GFP_NOWAIT);
+	if (!d)
+		return NULL;
+
+	d->hwdesc_count = periods;
+
+	/* TODO: re-check this... */
+	if (dir == DMA_DEV_TO_MEM)
+		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
+	else
+		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
+
+	if (uc->ud->match_data->type != DMA_TYPE_UDMA)
+		buf_addr |= (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
+
+	for (i = 0; i < periods; i++) {
+		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
+		dma_addr_t period_addr = buf_addr + (period_len * i);
+		struct cppi5_host_desc_t *h_desc;
+
+		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
+							   GFP_NOWAIT,
+							   &hwdesc->cppi5_desc_paddr);
+		if (!hwdesc->cppi5_desc_vaddr) {
+			dev_err(uc->ud->dev,
+				"descriptor%d allocation failed\n", i);
+
+			udma_free_hwdesc(uc, d);
+			kfree(d);
+			return NULL;
+		}
+
+		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
+		h_desc = hwdesc->cppi5_desc_vaddr;
+
+		cppi5_hdesc_init(h_desc, 0, 0);
+		cppi5_hdesc_set_pktlen(h_desc, period_len);
+
+		/* Flow and Packed ID */
+		cppi5_desc_set_pktids(&h_desc->hdr, uc->id,
+				      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
+		cppi5_desc_set_retpolicy(&h_desc->hdr, 0, ring_id);
+
+		/* attach each period to a new descriptor */
+		cppi5_hdesc_attach_buf(h_desc,
+				       period_addr, period_len,
+				       period_addr, period_len);
+	}
+
+	return d;
+}
+
+struct dma_async_tx_descriptor *
+udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
+		     size_t period_len, enum dma_transfer_direction dir,
+		     unsigned long flags)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	enum dma_slave_buswidth dev_width;
+	struct udma_desc *d;
+	u32 burst;
+
+	if (dir != uc->config.dir) {
+		dev_err(chan->device->dev,
+			"%s: chan%d is for %s, not supporting %s\n",
+			__func__, uc->id,
+			dmaengine_get_direction_text(uc->config.dir),
+			dmaengine_get_direction_text(dir));
+		return NULL;
+	}
+
+	uc->cyclic = true;
+
+	if (dir == DMA_DEV_TO_MEM) {
+		dev_width = uc->cfg.src_addr_width;
+		burst = uc->cfg.src_maxburst;
+	} else if (dir == DMA_MEM_TO_DEV) {
+		dev_width = uc->cfg.dst_addr_width;
+		burst = uc->cfg.dst_maxburst;
+	} else {
+		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
+		return NULL;
+	}
+
+	if (!burst)
+		burst = 1;
+
+	if (uc->config.pkt_mode)
+		d = udma_prep_dma_cyclic_pkt(uc, buf_addr, buf_len, period_len,
+					     dir, flags);
+	else
+		d = udma_prep_dma_cyclic_tr(uc, buf_addr, buf_len, period_len,
+					    dir, flags);
+
+	if (!d)
+		return NULL;
+
+	d->sglen = buf_len / period_len;
+
+	d->dir = dir;
+	d->residue = buf_len;
+
+	/* static TR for remote PDMA */
+	if (udma_configure_statictr(uc, d, dev_width, burst)) {
+		dev_err(uc->ud->dev,
+			"%s: StaticTR Z is limited to maximum %u (%u)\n",
+			__func__, uc->ud->match_data->statictr_z_mask,
+			d->static_tr.bstcnt);
+
+		udma_free_hwdesc(uc, d);
+		kfree(d);
+		return NULL;
+	}
+
+	if (uc->config.metadata_size)
+		d->vd.tx.metadata_ops = &metadata_ops;
+
+	return vchan_tx_prep(&uc->vc, &d->vd, flags);
+}
+EXPORT_SYMBOL_GPL(udma_prep_dma_cyclic);
+
+struct dma_async_tx_descriptor *
+udma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
+		     size_t len, unsigned long tx_flags)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_desc *d;
+	struct cppi5_tr_type15_t *tr_req;
+	int num_tr;
+	size_t tr_size = sizeof(struct cppi5_tr_type15_t);
+	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
+	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
+
+	if (uc->config.dir != DMA_MEM_TO_MEM) {
+		dev_err(chan->device->dev,
+			"%s: chan%d is for %s, not supporting %s\n",
+			__func__, uc->id,
+			dmaengine_get_direction_text(uc->config.dir),
+			dmaengine_get_direction_text(DMA_MEM_TO_MEM));
+		return NULL;
+	}
+
+	num_tr = udma_get_tr_counters(len, __ffs(src | dest), &tr0_cnt0,
+				      &tr0_cnt1, &tr1_cnt0);
+	if (num_tr < 0) {
+		dev_err(uc->ud->dev, "size %zu is not supported\n",
+			len);
+		return NULL;
+	}
+
+	d = udma_alloc_tr_desc(uc, tr_size, num_tr, DMA_MEM_TO_MEM);
+	if (!d)
+		return NULL;
+
+	d->dir = DMA_MEM_TO_MEM;
+	d->desc_idx = 0;
+	d->tr_idx = 0;
+	d->residue = len;
+
+	if (uc->ud->match_data->type != DMA_TYPE_UDMA) {
+		src |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
+		dest |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
+	} else {
+		csf |= CPPI5_TR_CSF_EOL_ICNT0;
+	}
+
+	tr_req = d->hwdesc[0].tr_req_base;
+
+	cppi5_tr_init(&tr_req[0].flags, CPPI5_TR_TYPE15, false, true,
+		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+	cppi5_tr_csf_set(&tr_req[0].flags, csf);
+
+	tr_req[0].addr = src;
+	tr_req[0].icnt0 = tr0_cnt0;
+	tr_req[0].icnt1 = tr0_cnt1;
+	tr_req[0].icnt2 = 1;
+	tr_req[0].icnt3 = 1;
+	tr_req[0].dim1 = tr0_cnt0;
+
+	tr_req[0].daddr = dest;
+	tr_req[0].dicnt0 = tr0_cnt0;
+	tr_req[0].dicnt1 = tr0_cnt1;
+	tr_req[0].dicnt2 = 1;
+	tr_req[0].dicnt3 = 1;
+	tr_req[0].ddim1 = tr0_cnt0;
+
+	if (num_tr == 2) {
+		cppi5_tr_init(&tr_req[1].flags, CPPI5_TR_TYPE15, false, true,
+			      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
+		cppi5_tr_csf_set(&tr_req[1].flags, csf);
+
+		tr_req[1].addr = src + tr0_cnt1 * tr0_cnt0;
+		tr_req[1].icnt0 = tr1_cnt0;
+		tr_req[1].icnt1 = 1;
+		tr_req[1].icnt2 = 1;
+		tr_req[1].icnt3 = 1;
+
+		tr_req[1].daddr = dest + tr0_cnt1 * tr0_cnt0;
+		tr_req[1].dicnt0 = tr1_cnt0;
+		tr_req[1].dicnt1 = 1;
+		tr_req[1].dicnt2 = 1;
+		tr_req[1].dicnt3 = 1;
+	}
+
+	cppi5_tr_csf_set(&tr_req[num_tr - 1].flags, csf | CPPI5_TR_CSF_EOP);
+
+	if (uc->config.metadata_size)
+		d->vd.tx.metadata_ops = &metadata_ops;
+
+	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
+}
+EXPORT_SYMBOL_GPL(udma_prep_dma_memcpy);
+
+void udma_desc_pre_callback(struct virt_dma_chan *vc,
+			    struct virt_dma_desc *vd,
+			    struct dmaengine_result *result)
+{
+	struct udma_chan *uc = to_udma_chan(&vc->chan);
+	struct udma_desc *d;
+	u8 status;
+
+	if (!vd)
+		return;
+
+	d = to_udma_desc(&vd->tx);
+
+	if (d->metadata_size)
+		udma_fetch_epib(uc, d);
+
+	if (result) {
+		void *desc_vaddr = udma_curr_cppi5_desc_vaddr(d, d->desc_idx);
+
+		if (cppi5_desc_get_type(desc_vaddr) ==
+		    CPPI5_INFO0_DESC_TYPE_VAL_HOST) {
+			/* Provide residue information for the client */
+			result->residue = d->residue -
+					  cppi5_hdesc_get_pktlen(desc_vaddr);
+			if (result->residue)
+				result->result = DMA_TRANS_ABORTED;
+			else
+				result->result = DMA_TRANS_NOERROR;
+		} else {
+			result->residue = 0;
+			/* Propagate TR Response errors to the client */
+			status = d->hwdesc[0].tr_resp_base->status;
+			if (status)
+				result->result = DMA_TRANS_ABORTED;
+			else
+				result->result = DMA_TRANS_NOERROR;
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(udma_desc_pre_callback);
+
+MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 0eaa06b7ae988..ae8b8ebd5dddd 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -131,105 +131,6 @@ static void udma_dump_chan_stdata(struct udma_chan *uc)
 	}
 }
 
-static struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
-						   dma_addr_t paddr)
-{
-	struct udma_desc *d = uc->terminated_desc;
-
-	if (d) {
-		dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
-								   d->desc_idx);
-
-		if (desc_paddr != paddr)
-			d = NULL;
-	}
-
-	if (!d) {
-		d = uc->desc;
-		if (d) {
-			dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
-								d->desc_idx);
-
-			if (desc_paddr != paddr)
-				d = NULL;
-		}
-	}
-
-	return d;
-}
-
-static void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d)
-{
-	if (uc->use_dma_pool) {
-		int i;
-
-		for (i = 0; i < d->hwdesc_count; i++) {
-			if (!d->hwdesc[i].cppi5_desc_vaddr)
-				continue;
-
-			dma_pool_free(uc->hdesc_pool,
-				      d->hwdesc[i].cppi5_desc_vaddr,
-				      d->hwdesc[i].cppi5_desc_paddr);
-
-			d->hwdesc[i].cppi5_desc_vaddr = NULL;
-		}
-	} else if (d->hwdesc[0].cppi5_desc_vaddr) {
-		dma_free_coherent(uc->dma_dev, d->hwdesc[0].cppi5_desc_size,
-				  d->hwdesc[0].cppi5_desc_vaddr,
-				  d->hwdesc[0].cppi5_desc_paddr);
-
-		d->hwdesc[0].cppi5_desc_vaddr = NULL;
-	}
-}
-
-static void udma_purge_desc_work(struct work_struct *work)
-{
-	struct udma_dev *ud = container_of(work, typeof(*ud), purge_work);
-	struct virt_dma_desc *vd, *_vd;
-	unsigned long flags;
-	LIST_HEAD(head);
-
-	spin_lock_irqsave(&ud->lock, flags);
-	list_splice_tail_init(&ud->desc_to_purge, &head);
-	spin_unlock_irqrestore(&ud->lock, flags);
-
-	list_for_each_entry_safe(vd, _vd, &head, node) {
-		struct udma_chan *uc = to_udma_chan(vd->tx.chan);
-		struct udma_desc *d = to_udma_desc(&vd->tx);
-
-		udma_free_hwdesc(uc, d);
-		list_del(&vd->node);
-		kfree(d);
-	}
-
-	/* If more to purge, schedule the work again */
-	if (!list_empty(&ud->desc_to_purge))
-		schedule_work(&ud->purge_work);
-}
-
-static void udma_desc_free(struct virt_dma_desc *vd)
-{
-	struct udma_dev *ud = to_udma_dev(vd->tx.chan->device);
-	struct udma_chan *uc = to_udma_chan(vd->tx.chan);
-	struct udma_desc *d = to_udma_desc(&vd->tx);
-	unsigned long flags;
-
-	if (uc->terminated_desc == d)
-		uc->terminated_desc = NULL;
-
-	if (uc->use_dma_pool) {
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return;
-	}
-
-	spin_lock_irqsave(&ud->lock, flags);
-	list_add_tail(&vd->node, &ud->desc_to_purge);
-	spin_unlock_irqrestore(&ud->lock, flags);
-
-	schedule_work(&ud->purge_work);
-}
-
 static bool udma_is_chan_running(struct udma_chan *uc)
 {
 	u32 trt_ctl = 0;
@@ -303,17 +204,6 @@ static int udma_push_to_ring(struct udma_chan *uc, int idx)
 	return k3_ringacc_ring_push(ring, &paddr);
 }
 
-static bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr)
-{
-	if (uc->config.dir != DMA_DEV_TO_MEM)
-		return false;
-
-	if (addr == udma_get_rx_flush_hwdesc_paddr(uc))
-		return true;
-
-	return false;
-}
-
 static int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr)
 {
 	struct k3_ring *ring = NULL;
@@ -674,33 +564,6 @@ static void udma_cyclic_packet_elapsed(struct udma_chan *uc)
 	d->desc_idx = (d->desc_idx + 1) % d->sglen;
 }
 
-static bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
-{
-	u32 peer_bcnt, bcnt;
-
-	/*
-	 * Only TX towards PDMA is affected.
-	 * If DMA_PREP_INTERRUPT is not set by consumer then skip the transfer
-	 * completion calculation, consumer must ensure that there is no stale
-	 * data in DMA fabric in this case.
-	 */
-	if (uc->config.ep_type == PSIL_EP_NATIVE ||
-	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
-		return true;
-
-	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
-	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
-
-	/* Transfer is incomplete, store current residue and time stamp */
-	if (peer_bcnt < bcnt) {
-		uc->tx_drain.residue = bcnt - peer_bcnt;
-		uc->tx_drain.tstamp = ktime_get();
-		return false;
-	}
-
-	return true;
-}
-
 static void udma_check_tx_completion(struct work_struct *work)
 {
 	struct udma_chan *uc = container_of(work, typeof(*uc),
@@ -2344,1047 +2207,6 @@ static int udma_slave_config(struct dma_chan *chan,
 	return 0;
 }
 
-static struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
-					    size_t tr_size, int tr_count,
-					    enum dma_transfer_direction dir)
-{
-	struct udma_hwdesc *hwdesc;
-	struct cppi5_desc_hdr_t *tr_desc;
-	struct udma_desc *d;
-	u32 reload_count = 0;
-	u32 ring_id;
-
-	switch (tr_size) {
-	case 16:
-	case 32:
-	case 64:
-	case 128:
-		break;
-	default:
-		dev_err(uc->ud->dev, "Unsupported TR size of %zu\n", tr_size);
-		return NULL;
-	}
-
-	/* We have only one descriptor containing multiple TRs */
-	d = kzalloc(sizeof(*d) + sizeof(d->hwdesc[0]), GFP_NOWAIT);
-	if (!d)
-		return NULL;
-
-	d->sglen = tr_count;
-
-	d->hwdesc_count = 1;
-	hwdesc = &d->hwdesc[0];
-
-	/* Allocate memory for DMA ring descriptor */
-	if (uc->use_dma_pool) {
-		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
-		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
-						GFP_NOWAIT,
-						&hwdesc->cppi5_desc_paddr);
-	} else {
-		hwdesc->cppi5_desc_size = cppi5_trdesc_calc_size(tr_size,
-								 tr_count);
-		hwdesc->cppi5_desc_size = ALIGN(hwdesc->cppi5_desc_size,
-						uc->ud->desc_align);
-		hwdesc->cppi5_desc_vaddr = dma_alloc_coherent(uc->ud->dev,
-						hwdesc->cppi5_desc_size,
-						&hwdesc->cppi5_desc_paddr,
-						GFP_NOWAIT);
-	}
-
-	if (!hwdesc->cppi5_desc_vaddr) {
-		kfree(d);
-		return NULL;
-	}
-
-	/* Start of the TR req records */
-	hwdesc->tr_req_base = hwdesc->cppi5_desc_vaddr + tr_size;
-	/* Start address of the TR response array */
-	hwdesc->tr_resp_base = hwdesc->tr_req_base + tr_size * tr_count;
-
-	tr_desc = hwdesc->cppi5_desc_vaddr;
-
-	if (uc->cyclic)
-		reload_count = CPPI5_INFO0_TRDESC_RLDCNT_INFINITE;
-
-	if (dir == DMA_DEV_TO_MEM)
-		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
-	else
-		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
-
-	cppi5_trdesc_init(tr_desc, tr_count, tr_size, 0, reload_count);
-	cppi5_desc_set_pktids(tr_desc, uc->id,
-			      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-	cppi5_desc_set_retpolicy(tr_desc, 0, ring_id);
-
-	return d;
-}
-
-/**
- * udma_get_tr_counters - calculate TR counters for a given length
- * @len: Length of the trasnfer
- * @align_to: Preferred alignment
- * @tr0_cnt0: First TR icnt0
- * @tr0_cnt1: First TR icnt1
- * @tr1_cnt0: Second (if used) TR icnt0
- *
- * For len < SZ_64K only one TR is enough, tr1_cnt0 is not updated
- * For len >= SZ_64K two TRs are used in a simple way:
- * First TR: SZ_64K-alignment blocks (tr0_cnt0, tr0_cnt1)
- * Second TR: the remaining length (tr1_cnt0)
- *
- * Returns the number of TRs the length needs (1 or 2)
- * -EINVAL if the length can not be supported
- */
-static int udma_get_tr_counters(size_t len, unsigned long align_to,
-				u16 *tr0_cnt0, u16 *tr0_cnt1, u16 *tr1_cnt0)
-{
-	if (len < SZ_64K) {
-		*tr0_cnt0 = len;
-		*tr0_cnt1 = 1;
-
-		return 1;
-	}
-
-	if (align_to > 3)
-		align_to = 3;
-
-realign:
-	*tr0_cnt0 = SZ_64K - BIT(align_to);
-	if (len / *tr0_cnt0 >= SZ_64K) {
-		if (align_to) {
-			align_to--;
-			goto realign;
-		}
-		return -EINVAL;
-	}
-
-	*tr0_cnt1 = len / *tr0_cnt0;
-	*tr1_cnt0 = len % *tr0_cnt0;
-
-	return 2;
-}
-
-static struct udma_desc *
-udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
-		      unsigned int sglen, enum dma_transfer_direction dir,
-		      unsigned long tx_flags, void *context)
-{
-	struct scatterlist *sgent;
-	struct udma_desc *d;
-	struct cppi5_tr_type1_t *tr_req = NULL;
-	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
-	unsigned int i;
-	size_t tr_size;
-	int num_tr = 0;
-	int tr_idx = 0;
-	u64 asel;
-
-	/* estimate the number of TRs we will need */
-	for_each_sg(sgl, sgent, sglen, i) {
-		if (sg_dma_len(sgent) < SZ_64K)
-			num_tr++;
-		else
-			num_tr += 2;
-	}
-
-	/* Now allocate and setup the descriptor. */
-	tr_size = sizeof(struct cppi5_tr_type1_t);
-	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
-	if (!d)
-		return NULL;
-
-	d->sglen = sglen;
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
-		asel = 0;
-	else
-		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-
-	tr_req = d->hwdesc[0].tr_req_base;
-	for_each_sg(sgl, sgent, sglen, i) {
-		dma_addr_t sg_addr = sg_dma_address(sgent);
-
-		num_tr = udma_get_tr_counters(sg_dma_len(sgent), __ffs(sg_addr),
-					      &tr0_cnt0, &tr0_cnt1, &tr1_cnt0);
-		if (num_tr < 0) {
-			dev_err(uc->ud->dev, "size %u is not supported\n",
-				sg_dma_len(sgent));
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
-			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
-
-		sg_addr |= asel;
-		tr_req[tr_idx].addr = sg_addr;
-		tr_req[tr_idx].icnt0 = tr0_cnt0;
-		tr_req[tr_idx].icnt1 = tr0_cnt1;
-		tr_req[tr_idx].dim1 = tr0_cnt0;
-		tr_idx++;
-
-		if (num_tr == 2) {
-			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
-				      false, false,
-				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
-					 CPPI5_TR_CSF_SUPR_EVT);
-
-			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
-			tr_req[tr_idx].icnt0 = tr1_cnt0;
-			tr_req[tr_idx].icnt1 = 1;
-			tr_req[tr_idx].dim1 = tr1_cnt0;
-			tr_idx++;
-		}
-
-		d->residue += sg_dma_len(sgent);
-	}
-
-	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags,
-			 CPPI5_TR_CSF_SUPR_EVT | CPPI5_TR_CSF_EOP);
-
-	return d;
-}
-
-static struct udma_desc *
-udma_prep_slave_sg_triggered_tr(struct udma_chan *uc, struct scatterlist *sgl,
-				unsigned int sglen,
-				enum dma_transfer_direction dir,
-				unsigned long tx_flags, void *context)
-{
-	struct scatterlist *sgent;
-	struct cppi5_tr_type15_t *tr_req = NULL;
-	enum dma_slave_buswidth dev_width;
-	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
-	u16 tr_cnt0, tr_cnt1;
-	dma_addr_t dev_addr;
-	struct udma_desc *d;
-	unsigned int i;
-	size_t tr_size, sg_len;
-	int num_tr = 0;
-	int tr_idx = 0;
-	u32 burst, trigger_size, port_window;
-	u64 asel;
-
-	if (dir == DMA_DEV_TO_MEM) {
-		dev_addr = uc->cfg.src_addr;
-		dev_width = uc->cfg.src_addr_width;
-		burst = uc->cfg.src_maxburst;
-		port_window = uc->cfg.src_port_window_size;
-	} else if (dir == DMA_MEM_TO_DEV) {
-		dev_addr = uc->cfg.dst_addr;
-		dev_width = uc->cfg.dst_addr_width;
-		burst = uc->cfg.dst_maxburst;
-		port_window = uc->cfg.dst_port_window_size;
-	} else {
-		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
-		return NULL;
-	}
-
-	if (!burst)
-		burst = 1;
-
-	if (port_window) {
-		if (port_window != burst) {
-			dev_err(uc->ud->dev,
-				"The burst must be equal to port_window\n");
-			return NULL;
-		}
-
-		tr_cnt0 = dev_width * port_window;
-		tr_cnt1 = 1;
-	} else {
-		tr_cnt0 = dev_width;
-		tr_cnt1 = burst;
-	}
-	trigger_size = tr_cnt0 * tr_cnt1;
-
-	/* estimate the number of TRs we will need */
-	for_each_sg(sgl, sgent, sglen, i) {
-		sg_len = sg_dma_len(sgent);
-
-		if (sg_len % trigger_size) {
-			dev_err(uc->ud->dev,
-				"Not aligned SG entry (%zu for %u)\n", sg_len,
-				trigger_size);
-			return NULL;
-		}
-
-		if (sg_len / trigger_size < SZ_64K)
-			num_tr++;
-		else
-			num_tr += 2;
-	}
-
-	/* Now allocate and setup the descriptor. */
-	tr_size = sizeof(struct cppi5_tr_type15_t);
-	d = udma_alloc_tr_desc(uc, tr_size, num_tr, dir);
-	if (!d)
-		return NULL;
-
-	d->sglen = sglen;
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA) {
-		asel = 0;
-		csf |= CPPI5_TR_CSF_EOL_ICNT0;
-	} else {
-		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-		dev_addr |= asel;
-	}
-
-	tr_req = d->hwdesc[0].tr_req_base;
-	for_each_sg(sgl, sgent, sglen, i) {
-		u16 tr0_cnt2, tr0_cnt3, tr1_cnt2;
-		dma_addr_t sg_addr = sg_dma_address(sgent);
-
-		sg_len = sg_dma_len(sgent);
-		num_tr = udma_get_tr_counters(sg_len / trigger_size, 0,
-					      &tr0_cnt2, &tr0_cnt3, &tr1_cnt2);
-		if (num_tr < 0) {
-			dev_err(uc->ud->dev, "size %zu is not supported\n",
-				sg_len);
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15, false,
-			      true, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
-		cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
-				     uc->config.tr_trigger_type,
-				     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC, 0, 0);
-
-		sg_addr |= asel;
-		if (dir == DMA_DEV_TO_MEM) {
-			tr_req[tr_idx].addr = dev_addr;
-			tr_req[tr_idx].icnt0 = tr_cnt0;
-			tr_req[tr_idx].icnt1 = tr_cnt1;
-			tr_req[tr_idx].icnt2 = tr0_cnt2;
-			tr_req[tr_idx].icnt3 = tr0_cnt3;
-			tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
-
-			tr_req[tr_idx].daddr = sg_addr;
-			tr_req[tr_idx].dicnt0 = tr_cnt0;
-			tr_req[tr_idx].dicnt1 = tr_cnt1;
-			tr_req[tr_idx].dicnt2 = tr0_cnt2;
-			tr_req[tr_idx].dicnt3 = tr0_cnt3;
-			tr_req[tr_idx].ddim1 = tr_cnt0;
-			tr_req[tr_idx].ddim2 = trigger_size;
-			tr_req[tr_idx].ddim3 = trigger_size * tr0_cnt2;
-		} else {
-			tr_req[tr_idx].addr = sg_addr;
-			tr_req[tr_idx].icnt0 = tr_cnt0;
-			tr_req[tr_idx].icnt1 = tr_cnt1;
-			tr_req[tr_idx].icnt2 = tr0_cnt2;
-			tr_req[tr_idx].icnt3 = tr0_cnt3;
-			tr_req[tr_idx].dim1 = tr_cnt0;
-			tr_req[tr_idx].dim2 = trigger_size;
-			tr_req[tr_idx].dim3 = trigger_size * tr0_cnt2;
-
-			tr_req[tr_idx].daddr = dev_addr;
-			tr_req[tr_idx].dicnt0 = tr_cnt0;
-			tr_req[tr_idx].dicnt1 = tr_cnt1;
-			tr_req[tr_idx].dicnt2 = tr0_cnt2;
-			tr_req[tr_idx].dicnt3 = tr0_cnt3;
-			tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
-		}
-
-		tr_idx++;
-
-		if (num_tr == 2) {
-			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE15,
-				      false, true,
-				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags, csf);
-			cppi5_tr_set_trigger(&tr_req[tr_idx].flags,
-					     uc->config.tr_trigger_type,
-					     CPPI5_TR_TRIGGER_TYPE_ICNT2_DEC,
-					     0, 0);
-
-			sg_addr += trigger_size * tr0_cnt2 * tr0_cnt3;
-			if (dir == DMA_DEV_TO_MEM) {
-				tr_req[tr_idx].addr = dev_addr;
-				tr_req[tr_idx].icnt0 = tr_cnt0;
-				tr_req[tr_idx].icnt1 = tr_cnt1;
-				tr_req[tr_idx].icnt2 = tr1_cnt2;
-				tr_req[tr_idx].icnt3 = 1;
-				tr_req[tr_idx].dim1 = (-1) * tr_cnt0;
-
-				tr_req[tr_idx].daddr = sg_addr;
-				tr_req[tr_idx].dicnt0 = tr_cnt0;
-				tr_req[tr_idx].dicnt1 = tr_cnt1;
-				tr_req[tr_idx].dicnt2 = tr1_cnt2;
-				tr_req[tr_idx].dicnt3 = 1;
-				tr_req[tr_idx].ddim1 = tr_cnt0;
-				tr_req[tr_idx].ddim2 = trigger_size;
-			} else {
-				tr_req[tr_idx].addr = sg_addr;
-				tr_req[tr_idx].icnt0 = tr_cnt0;
-				tr_req[tr_idx].icnt1 = tr_cnt1;
-				tr_req[tr_idx].icnt2 = tr1_cnt2;
-				tr_req[tr_idx].icnt3 = 1;
-				tr_req[tr_idx].dim1 = tr_cnt0;
-				tr_req[tr_idx].dim2 = trigger_size;
-
-				tr_req[tr_idx].daddr = dev_addr;
-				tr_req[tr_idx].dicnt0 = tr_cnt0;
-				tr_req[tr_idx].dicnt1 = tr_cnt1;
-				tr_req[tr_idx].dicnt2 = tr1_cnt2;
-				tr_req[tr_idx].dicnt3 = 1;
-				tr_req[tr_idx].ddim1 = (-1) * tr_cnt0;
-			}
-			tr_idx++;
-		}
-
-		d->residue += sg_len;
-	}
-
-	cppi5_tr_csf_set(&tr_req[tr_idx - 1].flags, csf | CPPI5_TR_CSF_EOP);
-
-	return d;
-}
-
-static int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
-				   enum dma_slave_buswidth dev_width,
-				   u16 elcnt)
-{
-	if (uc->config.ep_type != PSIL_EP_PDMA_XY)
-		return 0;
-
-	/* Bus width translates to the element size (ES) */
-	switch (dev_width) {
-	case DMA_SLAVE_BUSWIDTH_1_BYTE:
-		d->static_tr.elsize = 0;
-		break;
-	case DMA_SLAVE_BUSWIDTH_2_BYTES:
-		d->static_tr.elsize = 1;
-		break;
-	case DMA_SLAVE_BUSWIDTH_3_BYTES:
-		d->static_tr.elsize = 2;
-		break;
-	case DMA_SLAVE_BUSWIDTH_4_BYTES:
-		d->static_tr.elsize = 3;
-		break;
-	case DMA_SLAVE_BUSWIDTH_8_BYTES:
-		d->static_tr.elsize = 4;
-		break;
-	default: /* not reached */
-		return -EINVAL;
-	}
-
-	d->static_tr.elcnt = elcnt;
-
-	if (uc->config.pkt_mode || !uc->cyclic) {
-		/*
-		 * PDMA must close the packet when the channel is in packet mode.
-		 * For TR mode when the channel is not cyclic we also need PDMA
-		 * to close the packet otherwise the transfer will stall because
-		 * PDMA holds on the data it has received from the peripheral.
-		 */
-		unsigned int div = dev_width * elcnt;
-
-		if (uc->cyclic)
-			d->static_tr.bstcnt = d->residue / d->sglen / div;
-		else
-			d->static_tr.bstcnt = d->residue / div;
-	} else if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
-		   uc->config.dir == DMA_DEV_TO_MEM &&
-		   uc->cyclic) {
-		/*
-		 * For cyclic mode with BCDMA we have to set EOP in each TR to
-		 * prevent short packet errors seen on channel teardown. So the
-		 * PDMA must close the packet after every TR transfer by setting
-		 * burst count equal to the number of bytes transferred.
-		 */
-		struct cppi5_tr_type1_t *tr_req = d->hwdesc[0].tr_req_base;
-
-		d->static_tr.bstcnt =
-			(tr_req->icnt0 * tr_req->icnt1) / dev_width;
-	} else {
-		d->static_tr.bstcnt = 0;
-	}
-
-	if (uc->config.dir == DMA_DEV_TO_MEM &&
-	    d->static_tr.bstcnt > uc->ud->match_data->statictr_z_mask)
-		return -EINVAL;
-
-	return 0;
-}
-
-static struct udma_desc *
-udma_prep_slave_sg_pkt(struct udma_chan *uc, struct scatterlist *sgl,
-		       unsigned int sglen, enum dma_transfer_direction dir,
-		       unsigned long tx_flags, void *context)
-{
-	struct scatterlist *sgent;
-	struct cppi5_host_desc_t *h_desc = NULL;
-	struct udma_desc *d;
-	u32 ring_id;
-	unsigned int i;
-	u64 asel;
-
-	d = kzalloc_flex(*d, hwdesc, sglen, GFP_NOWAIT);
-	if (!d)
-		return NULL;
-
-	d->sglen = sglen;
-	d->hwdesc_count = sglen;
-
-	if (dir == DMA_DEV_TO_MEM)
-		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
-	else
-		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
-
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
-		asel = 0;
-	else
-		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-
-	for_each_sg(sgl, sgent, sglen, i) {
-		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
-		dma_addr_t sg_addr = sg_dma_address(sgent);
-		struct cppi5_host_desc_t *desc;
-		size_t sg_len = sg_dma_len(sgent);
-
-		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
-						GFP_NOWAIT,
-						&hwdesc->cppi5_desc_paddr);
-		if (!hwdesc->cppi5_desc_vaddr) {
-			dev_err(uc->ud->dev,
-				"descriptor%d allocation failed\n", i);
-
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		d->residue += sg_len;
-		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
-		desc = hwdesc->cppi5_desc_vaddr;
-
-		if (i == 0) {
-			cppi5_hdesc_init(desc, 0, 0);
-			/* Flow and Packed ID */
-			cppi5_desc_set_pktids(&desc->hdr, uc->id,
-					      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-			cppi5_desc_set_retpolicy(&desc->hdr, 0, ring_id);
-		} else {
-			cppi5_hdesc_reset_hbdesc(desc);
-			cppi5_desc_set_retpolicy(&desc->hdr, 0, 0xffff);
-		}
-
-		/* attach the sg buffer to the descriptor */
-		sg_addr |= asel;
-		cppi5_hdesc_attach_buf(desc, sg_addr, sg_len, sg_addr, sg_len);
-
-		/* Attach link as host buffer descriptor */
-		if (h_desc)
-			cppi5_hdesc_link_hbdesc(h_desc,
-						hwdesc->cppi5_desc_paddr | asel);
-
-		if (uc->ud->match_data->type == DMA_TYPE_PKTDMA ||
-		    dir == DMA_MEM_TO_DEV)
-			h_desc = desc;
-	}
-
-	if (d->residue >= SZ_4M) {
-		dev_err(uc->ud->dev,
-			"%s: Transfer size %u is over the supported 4M range\n",
-			__func__, d->residue);
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return NULL;
-	}
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-	cppi5_hdesc_set_pktlen(h_desc, d->residue);
-
-	return d;
-}
-
-static int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
-				void *data, size_t len)
-{
-	struct udma_desc *d = to_udma_desc(desc);
-	struct udma_chan *uc = to_udma_chan(desc->chan);
-	struct cppi5_host_desc_t *h_desc;
-	u32 psd_size = len;
-	u32 flags = 0;
-
-	if (!uc->config.pkt_mode || !uc->config.metadata_size)
-		return -ENOTSUPP;
-
-	if (!data || len > uc->config.metadata_size)
-		return -EINVAL;
-
-	if (uc->config.needs_epib && len < CPPI5_INFO0_HDESC_EPIB_SIZE)
-		return -EINVAL;
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-	if (d->dir == DMA_MEM_TO_DEV)
-		memcpy(h_desc->epib, data, len);
-
-	if (uc->config.needs_epib)
-		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
-
-	d->metadata = data;
-	d->metadata_size = len;
-	if (uc->config.needs_epib)
-		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
-
-	cppi5_hdesc_update_flags(h_desc, flags);
-	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
-
-	return 0;
-}
-
-static void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
-				   size_t *payload_len, size_t *max_len)
-{
-	struct udma_desc *d = to_udma_desc(desc);
-	struct udma_chan *uc = to_udma_chan(desc->chan);
-	struct cppi5_host_desc_t *h_desc;
-
-	if (!uc->config.pkt_mode || !uc->config.metadata_size)
-		return ERR_PTR(-ENOTSUPP);
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	*max_len = uc->config.metadata_size;
-
-	*payload_len = cppi5_hdesc_epib_present(&h_desc->hdr) ?
-		       CPPI5_INFO0_HDESC_EPIB_SIZE : 0;
-	*payload_len += cppi5_hdesc_get_psdata_size(h_desc);
-
-	return h_desc->epib;
-}
-
-static int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
-				 size_t payload_len)
-{
-	struct udma_desc *d = to_udma_desc(desc);
-	struct udma_chan *uc = to_udma_chan(desc->chan);
-	struct cppi5_host_desc_t *h_desc;
-	u32 psd_size = payload_len;
-	u32 flags = 0;
-
-	if (!uc->config.pkt_mode || !uc->config.metadata_size)
-		return -ENOTSUPP;
-
-	if (payload_len > uc->config.metadata_size)
-		return -EINVAL;
-
-	if (uc->config.needs_epib && payload_len < CPPI5_INFO0_HDESC_EPIB_SIZE)
-		return -EINVAL;
-
-	h_desc = d->hwdesc[0].cppi5_desc_vaddr;
-
-	if (uc->config.needs_epib) {
-		psd_size -= CPPI5_INFO0_HDESC_EPIB_SIZE;
-		flags |= CPPI5_INFO0_HDESC_EPIB_PRESENT;
-	}
-
-	cppi5_hdesc_update_flags(h_desc, flags);
-	cppi5_hdesc_update_psdata_size(h_desc, psd_size);
-
-	return 0;
-}
-
-static const struct dma_descriptor_metadata_ops metadata_ops = {
-	.attach = udma_attach_metadata,
-	.get_ptr = udma_get_metadata_ptr,
-	.set_len = udma_set_metadata_len,
-};
-
-static struct dma_async_tx_descriptor *
-udma_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
-		   unsigned int sglen, enum dma_transfer_direction dir,
-		   unsigned long tx_flags, void *context)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	enum dma_slave_buswidth dev_width;
-	struct udma_desc *d;
-	u32 burst;
-
-	if (dir != uc->config.dir &&
-	    (uc->config.dir == DMA_MEM_TO_MEM && !uc->config.tr_trigger_type)) {
-		dev_err(chan->device->dev,
-			"%s: chan%d is for %s, not supporting %s\n",
-			__func__, uc->id,
-			dmaengine_get_direction_text(uc->config.dir),
-			dmaengine_get_direction_text(dir));
-		return NULL;
-	}
-
-	if (dir == DMA_DEV_TO_MEM) {
-		dev_width = uc->cfg.src_addr_width;
-		burst = uc->cfg.src_maxburst;
-	} else if (dir == DMA_MEM_TO_DEV) {
-		dev_width = uc->cfg.dst_addr_width;
-		burst = uc->cfg.dst_maxburst;
-	} else {
-		dev_err(chan->device->dev, "%s: bad direction?\n", __func__);
-		return NULL;
-	}
-
-	if (!burst)
-		burst = 1;
-
-	uc->config.tx_flags = tx_flags;
-
-	if (uc->config.pkt_mode)
-		d = udma_prep_slave_sg_pkt(uc, sgl, sglen, dir, tx_flags,
-					   context);
-	else if (is_slave_direction(uc->config.dir))
-		d = udma_prep_slave_sg_tr(uc, sgl, sglen, dir, tx_flags,
-					  context);
-	else
-		d = udma_prep_slave_sg_triggered_tr(uc, sgl, sglen, dir,
-						    tx_flags, context);
-
-	if (!d)
-		return NULL;
-
-	d->dir = dir;
-	d->desc_idx = 0;
-	d->tr_idx = 0;
-
-	/* static TR for remote PDMA */
-	if (udma_configure_statictr(uc, d, dev_width, burst)) {
-		dev_err(uc->ud->dev,
-			"%s: StaticTR Z is limited to maximum %u (%u)\n",
-			__func__, uc->ud->match_data->statictr_z_mask,
-			d->static_tr.bstcnt);
-
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return NULL;
-	}
-
-	if (uc->config.metadata_size)
-		d->vd.tx.metadata_ops = &metadata_ops;
-
-	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
-}
-
-static struct udma_desc *
-udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
-			size_t buf_len, size_t period_len,
-			enum dma_transfer_direction dir, unsigned long flags)
-{
-	struct udma_desc *d;
-	size_t tr_size, period_addr;
-	struct cppi5_tr_type1_t *tr_req;
-	unsigned int periods = buf_len / period_len;
-	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
-	unsigned int i;
-	int num_tr;
-	u32 period_csf = 0;
-
-	num_tr = udma_get_tr_counters(period_len, __ffs(buf_addr), &tr0_cnt0,
-				      &tr0_cnt1, &tr1_cnt0);
-	if (num_tr < 0) {
-		dev_err(uc->ud->dev, "size %zu is not supported\n",
-			period_len);
-		return NULL;
-	}
-
-	/* Now allocate and setup the descriptor. */
-	tr_size = sizeof(struct cppi5_tr_type1_t);
-	d = udma_alloc_tr_desc(uc, tr_size, periods * num_tr, dir);
-	if (!d)
-		return NULL;
-
-	tr_req = d->hwdesc[0].tr_req_base;
-	if (uc->ud->match_data->type == DMA_TYPE_UDMA)
-		period_addr = buf_addr;
-	else
-		period_addr = buf_addr |
-			((u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT);
-
-	/*
-	 * For BCDMA <-> PDMA transfers, the EOP flag needs to be set on the
-	 * last TR of a descriptor, to mark the packet as complete.
-	 * This is required for getting the teardown completion message in case
-	 * of TX, and to avoid short-packet error in case of RX.
-	 *
-	 * As we are in cyclic mode, we do not know which period might be the
-	 * last one, so set the flag for each period.
-	 */
-	if (uc->config.ep_type == PSIL_EP_PDMA_XY &&
-	    uc->ud->match_data->type == DMA_TYPE_BCDMA) {
-		period_csf = CPPI5_TR_CSF_EOP;
-	}
-
-	for (i = 0; i < periods; i++) {
-		int tr_idx = i * num_tr;
-
-		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
-			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-
-		tr_req[tr_idx].addr = period_addr;
-		tr_req[tr_idx].icnt0 = tr0_cnt0;
-		tr_req[tr_idx].icnt1 = tr0_cnt1;
-		tr_req[tr_idx].dim1 = tr0_cnt0;
-
-		if (num_tr == 2) {
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
-					 CPPI5_TR_CSF_SUPR_EVT);
-			tr_idx++;
-
-			cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1,
-				      false, false,
-				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-
-			tr_req[tr_idx].addr = period_addr + tr0_cnt1 * tr0_cnt0;
-			tr_req[tr_idx].icnt0 = tr1_cnt0;
-			tr_req[tr_idx].icnt1 = 1;
-			tr_req[tr_idx].dim1 = tr1_cnt0;
-		}
-
-		if (!(flags & DMA_PREP_INTERRUPT))
-			period_csf |= CPPI5_TR_CSF_SUPR_EVT;
-
-		if (period_csf)
-			cppi5_tr_csf_set(&tr_req[tr_idx].flags, period_csf);
-
-		period_addr += period_len;
-	}
-
-	return d;
-}
-
-static struct udma_desc *
-udma_prep_dma_cyclic_pkt(struct udma_chan *uc, dma_addr_t buf_addr,
-			 size_t buf_len, size_t period_len,
-			 enum dma_transfer_direction dir, unsigned long flags)
-{
-	struct udma_desc *d;
-	u32 ring_id;
-	int i;
-	int periods = buf_len / period_len;
-
-	if (periods > (K3_UDMA_DEFAULT_RING_SIZE - 1))
-		return NULL;
-
-	if (period_len >= SZ_4M)
-		return NULL;
-
-	d = kzalloc_flex(*d, hwdesc, periods, GFP_NOWAIT);
-	if (!d)
-		return NULL;
-
-	d->hwdesc_count = periods;
-
-	/* TODO: re-check this... */
-	if (dir == DMA_DEV_TO_MEM)
-		ring_id = k3_ringacc_get_ring_id(uc->rflow->r_ring);
-	else
-		ring_id = k3_ringacc_get_ring_id(uc->tchan->tc_ring);
-
-	if (uc->ud->match_data->type != DMA_TYPE_UDMA)
-		buf_addr |= (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
-
-	for (i = 0; i < periods; i++) {
-		struct udma_hwdesc *hwdesc = &d->hwdesc[i];
-		dma_addr_t period_addr = buf_addr + (period_len * i);
-		struct cppi5_host_desc_t *h_desc;
-
-		hwdesc->cppi5_desc_vaddr = dma_pool_zalloc(uc->hdesc_pool,
-						GFP_NOWAIT,
-						&hwdesc->cppi5_desc_paddr);
-		if (!hwdesc->cppi5_desc_vaddr) {
-			dev_err(uc->ud->dev,
-				"descriptor%d allocation failed\n", i);
-
-			udma_free_hwdesc(uc, d);
-			kfree(d);
-			return NULL;
-		}
-
-		hwdesc->cppi5_desc_size = uc->config.hdesc_size;
-		h_desc = hwdesc->cppi5_desc_vaddr;
-
-		cppi5_hdesc_init(h_desc, 0, 0);
-		cppi5_hdesc_set_pktlen(h_desc, period_len);
-
-		/* Flow and Packed ID */
-		cppi5_desc_set_pktids(&h_desc->hdr, uc->id,
-				      CPPI5_INFO1_DESC_FLOWID_DEFAULT);
-		cppi5_desc_set_retpolicy(&h_desc->hdr, 0, ring_id);
-
-		/* attach each period to a new descriptor */
-		cppi5_hdesc_attach_buf(h_desc,
-				       period_addr, period_len,
-				       period_addr, period_len);
-	}
-
-	return d;
-}
-
-static struct dma_async_tx_descriptor *
-udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr, size_t buf_len,
-		     size_t period_len, enum dma_transfer_direction dir,
-		     unsigned long flags)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	enum dma_slave_buswidth dev_width;
-	struct udma_desc *d;
-	u32 burst;
-
-	if (dir != uc->config.dir) {
-		dev_err(chan->device->dev,
-			"%s: chan%d is for %s, not supporting %s\n",
-			__func__, uc->id,
-			dmaengine_get_direction_text(uc->config.dir),
-			dmaengine_get_direction_text(dir));
-		return NULL;
-	}
-
-	uc->cyclic = true;
-
-	if (dir == DMA_DEV_TO_MEM) {
-		dev_width = uc->cfg.src_addr_width;
-		burst = uc->cfg.src_maxburst;
-	} else if (dir == DMA_MEM_TO_DEV) {
-		dev_width = uc->cfg.dst_addr_width;
-		burst = uc->cfg.dst_maxburst;
-	} else {
-		dev_err(uc->ud->dev, "%s: bad direction?\n", __func__);
-		return NULL;
-	}
-
-	if (!burst)
-		burst = 1;
-
-	if (uc->config.pkt_mode)
-		d = udma_prep_dma_cyclic_pkt(uc, buf_addr, buf_len, period_len,
-					     dir, flags);
-	else
-		d = udma_prep_dma_cyclic_tr(uc, buf_addr, buf_len, period_len,
-					    dir, flags);
-
-	if (!d)
-		return NULL;
-
-	d->sglen = buf_len / period_len;
-
-	d->dir = dir;
-	d->residue = buf_len;
-
-	/* static TR for remote PDMA */
-	if (udma_configure_statictr(uc, d, dev_width, burst)) {
-		dev_err(uc->ud->dev,
-			"%s: StaticTR Z is limited to maximum %u (%u)\n",
-			__func__, uc->ud->match_data->statictr_z_mask,
-			d->static_tr.bstcnt);
-
-		udma_free_hwdesc(uc, d);
-		kfree(d);
-		return NULL;
-	}
-
-	if (uc->config.metadata_size)
-		d->vd.tx.metadata_ops = &metadata_ops;
-
-	return vchan_tx_prep(&uc->vc, &d->vd, flags);
-}
-
-static struct dma_async_tx_descriptor *
-udma_prep_dma_memcpy(struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
-		     size_t len, unsigned long tx_flags)
-{
-	struct udma_chan *uc = to_udma_chan(chan);
-	struct udma_desc *d;
-	struct cppi5_tr_type15_t *tr_req;
-	int num_tr;
-	size_t tr_size = sizeof(struct cppi5_tr_type15_t);
-	u16 tr0_cnt0, tr0_cnt1, tr1_cnt0;
-	u32 csf = CPPI5_TR_CSF_SUPR_EVT;
-
-	if (uc->config.dir != DMA_MEM_TO_MEM) {
-		dev_err(chan->device->dev,
-			"%s: chan%d is for %s, not supporting %s\n",
-			__func__, uc->id,
-			dmaengine_get_direction_text(uc->config.dir),
-			dmaengine_get_direction_text(DMA_MEM_TO_MEM));
-		return NULL;
-	}
-
-	num_tr = udma_get_tr_counters(len, __ffs(src | dest), &tr0_cnt0,
-				      &tr0_cnt1, &tr1_cnt0);
-	if (num_tr < 0) {
-		dev_err(uc->ud->dev, "size %zu is not supported\n",
-			len);
-		return NULL;
-	}
-
-	d = udma_alloc_tr_desc(uc, tr_size, num_tr, DMA_MEM_TO_MEM);
-	if (!d)
-		return NULL;
-
-	d->dir = DMA_MEM_TO_MEM;
-	d->desc_idx = 0;
-	d->tr_idx = 0;
-	d->residue = len;
-
-	if (uc->ud->match_data->type != DMA_TYPE_UDMA) {
-		src |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
-		dest |= (u64)uc->ud->asel << K3_ADDRESS_ASEL_SHIFT;
-	} else {
-		csf |= CPPI5_TR_CSF_EOL_ICNT0;
-	}
-
-	tr_req = d->hwdesc[0].tr_req_base;
-
-	cppi5_tr_init(&tr_req[0].flags, CPPI5_TR_TYPE15, false, true,
-		      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-	cppi5_tr_csf_set(&tr_req[0].flags, csf);
-
-	tr_req[0].addr = src;
-	tr_req[0].icnt0 = tr0_cnt0;
-	tr_req[0].icnt1 = tr0_cnt1;
-	tr_req[0].icnt2 = 1;
-	tr_req[0].icnt3 = 1;
-	tr_req[0].dim1 = tr0_cnt0;
-
-	tr_req[0].daddr = dest;
-	tr_req[0].dicnt0 = tr0_cnt0;
-	tr_req[0].dicnt1 = tr0_cnt1;
-	tr_req[0].dicnt2 = 1;
-	tr_req[0].dicnt3 = 1;
-	tr_req[0].ddim1 = tr0_cnt0;
-
-	if (num_tr == 2) {
-		cppi5_tr_init(&tr_req[1].flags, CPPI5_TR_TYPE15, false, true,
-			      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[1].flags, csf);
-
-		tr_req[1].addr = src + tr0_cnt1 * tr0_cnt0;
-		tr_req[1].icnt0 = tr1_cnt0;
-		tr_req[1].icnt1 = 1;
-		tr_req[1].icnt2 = 1;
-		tr_req[1].icnt3 = 1;
-
-		tr_req[1].daddr = dest + tr0_cnt1 * tr0_cnt0;
-		tr_req[1].dicnt0 = tr1_cnt0;
-		tr_req[1].dicnt1 = 1;
-		tr_req[1].dicnt2 = 1;
-		tr_req[1].dicnt3 = 1;
-	}
-
-	cppi5_tr_csf_set(&tr_req[num_tr - 1].flags, csf | CPPI5_TR_CSF_EOP);
-
-	if (uc->config.metadata_size)
-		d->vd.tx.metadata_ops = &metadata_ops;
-
-	return vchan_tx_prep(&uc->vc, &d->vd, tx_flags);
-}
-
 static void udma_issue_pending(struct dma_chan *chan)
 {
 	struct udma_chan *uc = to_udma_chan(chan);
@@ -3587,46 +2409,6 @@ static void udma_synchronize(struct dma_chan *chan)
 	udma_reset_rings(uc);
 }
 
-static void udma_desc_pre_callback(struct virt_dma_chan *vc,
-				   struct virt_dma_desc *vd,
-				   struct dmaengine_result *result)
-{
-	struct udma_chan *uc = to_udma_chan(&vc->chan);
-	struct udma_desc *d;
-	u8 status;
-
-	if (!vd)
-		return;
-
-	d = to_udma_desc(&vd->tx);
-
-	if (d->metadata_size)
-		udma_fetch_epib(uc, d);
-
-	if (result) {
-		void *desc_vaddr = udma_curr_cppi5_desc_vaddr(d, d->desc_idx);
-
-		if (cppi5_desc_get_type(desc_vaddr) ==
-		    CPPI5_INFO0_DESC_TYPE_VAL_HOST) {
-			/* Provide residue information for the client */
-			result->residue = d->residue -
-					  cppi5_hdesc_get_pktlen(desc_vaddr);
-			if (result->residue)
-				result->result = DMA_TRANS_ABORTED;
-			else
-				result->result = DMA_TRANS_NOERROR;
-		} else {
-			result->residue = 0;
-			/* Propagate TR Response errors to the client */
-			status = d->hwdesc[0].tr_resp_base->status;
-			if (status)
-				result->result = DMA_TRANS_ABORTED;
-			else
-				result->result = DMA_TRANS_NOERROR;
-		}
-	}
-}
-
 /*
  * This tasklet handles the completion of a DMA descriptor by
  * calling its callback and freeing it.
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 54e1757c3de38..62c15b0cc9ae7 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -560,6 +560,60 @@ static inline void udma_fetch_epib(struct udma_chan *uc, struct udma_desc *d)
 	memcpy(d->metadata, h_desc->epib, d->metadata_size);
 }
 
+/* Common functions */
+struct udma_desc *udma_udma_desc_from_paddr(struct udma_chan *uc,
+					    dma_addr_t paddr);
+void udma_free_hwdesc(struct udma_chan *uc, struct udma_desc *d);
+void udma_purge_desc_work(struct work_struct *work);
+void udma_desc_free(struct virt_dma_desc *vd);
+bool udma_desc_is_rx_flush(struct udma_chan *uc, dma_addr_t addr);
+bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d);
+struct udma_desc *udma_alloc_tr_desc(struct udma_chan *uc,
+				     size_t tr_size, int tr_count,
+				     enum dma_transfer_direction dir);
+int udma_get_tr_counters(size_t len, unsigned long align_to,
+			 u16 *tr0_cnt0, u16 *tr0_cnt1, u16 *tr1_cnt0);
+struct udma_desc *udma_prep_slave_sg_tr(struct udma_chan *uc,
+					struct scatterlist *sgl, unsigned int sglen,
+					enum dma_transfer_direction dir,
+					unsigned long tx_flags, void *context);
+struct udma_desc *udma_prep_slave_sg_triggered_tr(struct udma_chan *uc,
+						  struct scatterlist *sgl, unsigned int sglen,
+						  enum dma_transfer_direction dir,
+						  unsigned long tx_flags, void *context);
+int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
+			    enum dma_slave_buswidth dev_width, u16 elcnt);
+struct udma_desc *udma_prep_slave_sg_pkt(struct udma_chan *uc,
+					 struct scatterlist *sgl, unsigned int sglen,
+					 enum dma_transfer_direction dir,
+					 unsigned long tx_flags, void *context);
+int udma_attach_metadata(struct dma_async_tx_descriptor *desc,
+			 void *data, size_t len);
+void *udma_get_metadata_ptr(struct dma_async_tx_descriptor *desc,
+			    size_t *payload_len, size_t *max_len);
+int udma_set_metadata_len(struct dma_async_tx_descriptor *desc,
+			  size_t payload_len);
+struct dma_async_tx_descriptor *udma_prep_slave_sg(struct dma_chan *chan,
+						   struct scatterlist *sgl, unsigned int sglen,
+						   enum dma_transfer_direction dir,
+						   unsigned long tx_flags, void *context);
+struct udma_desc *udma_prep_dma_cyclic_tr(struct udma_chan *uc,
+					  dma_addr_t buf_addr, size_t buf_len, size_t period_len,
+					  enum dma_transfer_direction dir, unsigned long flags);
+struct udma_desc *udma_prep_dma_cyclic_pkt(struct udma_chan *uc,
+					   dma_addr_t buf_addr, size_t buf_len, size_t period_len,
+					   enum dma_transfer_direction dir, unsigned long flags);
+struct dma_async_tx_descriptor *udma_prep_dma_cyclic(struct dma_chan *chan, dma_addr_t buf_addr,
+						     size_t buf_len, size_t period_len,
+						     enum dma_transfer_direction dir,
+						     unsigned long flags);
+struct dma_async_tx_descriptor *udma_prep_dma_memcpy(struct dma_chan *chan,
+						     dma_addr_t dest, dma_addr_t src,
+						     size_t len, unsigned long tx_flags);
+void udma_desc_pre_callback(struct virt_dma_chan *vc,
+			    struct virt_dma_desc *vd,
+			    struct dmaengine_result *result);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

