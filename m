Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316DA421A08;
	Mon, 10 Aug 2026 15:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375000; cv=fail; b=fDXFabgwqAvTCmn7ISLL3gkfCX8YDFaJ6grxcnfgQT7g1mPptwdCl9LDyIUK2mWDKTNshquGdTQNfQhNnhsCzqg8zJVG3452ByfDcItSX4lql9ShrG05EiVgJ1MndxF8m0GJV1bCyMJ/AavTvXeYEF4qcmcmizBIpkPBkGzPabE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375000; c=relaxed/simple;
	bh=//AKy6LfUx7ahlSA1+wy09dTLvCMUqJr4Jr0bR7lM98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SmjH3zME2jW532NTxHjqnwZ2NtDKWB5l4EOVfzrs/q1JT5ikjFCiK/r4L09xGvJhCkJOKmuUf2hNZe5RrUkPhqaipg3ShdNldEJGUcZCA/yTzZ8k1L6r1S/eKh69EJHyS2vuwKI+YKABj1zD3R39MBGXT0ZSl1fNr04ldEKFEzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hMKNAQJz; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WngMfrxo; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hMKNAQJz";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WngMfrxo"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUfgM3620535;
	Mon, 10 Aug 2026 10:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=atzeCy6ttKPPo8s/AG3bXIJB9XI2KEfeuRrOX8mK3
	VQ=; b=hMKNAQJzGFPnEiq8PpGtU9SEblTIY8Rs/ynUDpscUAAlzObmBnkwniMX3
	sUKv5q4MZy1eBgeL5ZvBrfzBQogxoszv7O3a1z4YFqSNRVMV6f5kCzi2G5Ysi+I4
	LTuvAyN783Y3v4AsbolGWQ79+6qjx7WfGeo1/CT/Tk1WS4/7WQSV4fZ/ojoft6mJ
	Oy+Bm3UuPdKpE7W0s6inBPgU9Hb6TNuf6qc/Gfrn7EUHtcwmeRCNGwj+ezdntHtQ
	2GODzslIjfeHCls2+p1kxJkA855MwWeXherCao2kX7JZJI3IRB0X3UYbHvIcWcS9
	cVBrvvfLh3SCFszRv7SRKzLPE1qVA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012013.outbound.protection.outlook.com [52.101.43.13])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79haj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:16:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2V9ZtCS8dEHZgaVxTTJ0hdTTiHx1XZZq/4JtLZ5kW/ys0M3qk4KR/4/Pz8K88t1BMdZOmnJ3DifeTBX56xqjyumq33bn8I09HSd3qtNJfYsUIyAVeWsQ1GvITfsnID/hMybY46sCzhg+Z7tnbraTNJSs5Htgx6gQy33+XUOb7QnDtQ5YP4OAqVwZR4/qPh2lGE1q8a9ZZJkrB47+xSJlo5fCmJtLTk4Dg+nDdPLQJsmwJu8oRui9QLk7RCVwzGYD1zJHmC2RN8rtDlWLQEQyjY2qyOvKEA+1+/Kg1gzQyneIH71v3UNV6MDvMym0AgD6uhn54Rknel5iR5FF4kf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=atzeCy6ttKPPo8s/AG3bXIJB9XI2KEfeuRrOX8mK3VQ=;
 b=etsxHigvtdvXu5QXjGCEHIEOf0OKPVxQOhv3/oqduMblJIAcNKIa6zxp9Q0AMYV2HD/5rKRNeZlOBRKZT+gH3vpvRI/vYctWiOo5+LazLu0hl2A2D9VYsy+1KVrcBCA7hcjCMaiipKVU2sNfzd4g9CEqLVgUaSjMQN01WN/YLHWVsZaqsyaYuJunBROAvQ/ajMC0eeRzqRpgkftUnUib1jotqtiaaQdsEHjlWha3NPUGtv5TDg0y8L3t+pVlEj7l4aQF7kF0tFRrd3xISPOONxErbpHhBJ8u9C0tzejDy7yyLgW1J47SCyMroSELA95H37jkhFiC1ZGEOgoMHskdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=atzeCy6ttKPPo8s/AG3bXIJB9XI2KEfeuRrOX8mK3VQ=;
 b=WngMfrxo9eEljXWe7rPs5v9bEYiKHzUj/HoC/Ph4OyPPMk5oc+C/2QTDpi/FErpVAmPXzz3lCzIWaklCTDwTd6PUgtY1sugT07XfhWzbTeocswAl2xPQT01k7tfgWwxrjoMwK4JQbsIi8b2R2sOvj/RkBGD5wZ88TLtmxICZyP4=
Received: from PH8PR20CA0016.namprd20.prod.outlook.com (2603:10b6:510:23c::20)
 by MN2PR10MB4351.namprd10.prod.outlook.com (2603:10b6:208:1d7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:16:22 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:510:23c:cafe::67) by PH8PR20CA0016.outlook.office365.com
 (2603:10b6:510:23c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:16:21 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:57 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:57 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERWE2648613;
	Mon, 10 Aug 2026 10:15:53 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 19/19] dmaengine: ti: k3-udma: Validate resource ID and fix logging in reservation
Date: Mon, 10 Aug 2026 20:44:13 +0530
Message-ID: <20260810151423.1948224-20-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|MN2PR10MB4351:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fa6c26c-40b0-432e-46e7-08def6f255aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|82310400026|36860700016|921020|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	CTwSQzPVXIeQrMkxEwyEoAGhymTOziD4Y5sX7/ajOeoPA0OWykXoxnbGx867vLx9xSqseAqQ9QwSCNw26k9HrOGLDYRPMlA2JFDyAqlQt7EkYAUmwLpPKyfLeKnhXSeHJ5uiuzSe0ER2CqYqDd+TJxXq4OxMU9zZ3FwFHL4haH3hXYJydc7tF5TObUtNohzC9O+ld3JKiWp5s7c5TtTtG6geCCMl2vDFHYTvXg1362beWepc04x6e0Se/3yiF22UtzQeJyeJ44s0leZqx5md5Dzf0BejygPCYyTnO4yZOTPSPMGoW0B662Oo6Q6MCN4wn2oEZEGPFy3cCBKxqGZ3AovBl0GL8GGNrZhehU37M1GxBitTXfGbU0r10gjrxdSEyLYg//iC0GwrAD6z7uvTz18OInu6SBp7EIEGvZUYBANofocGKQ8ShBb7hThGETeJbTN2sYpqZH2x7eGCDXqJH8CWnq6Bzu3/Vq/Kj6Wkww+AYcGOPSkRydO+worN97VwQtCVe+Bl0WQ/cpuy8gnWNbOPJ+jVTH+dlovT/xZLzF5FalMS6zVJsdAqfNIFAleAN8u/g9pFosiRHr920r8xmIPGAG/jBmOOUJ42qYHL5iNw+wnD3GNSn5TILkH+nfOComwv97N6wexuM2ZWUyGARWd4M0M8vJvxhGXsHCMdzGIJE1y3PAyvaazg/8byXQqr7hopOjSn57wqL71+X7Xn0p3vnhcwP+2YoNCMymyL8pPVrM2GPtfD60/l3XiMiMoN
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sSw0w7wSBm5B6PF2xcAh4cx0HqQ90Q4/ljtPYbQ/CIWU8ofx+DOWdWIk7oCADTCBAEZHfkGCIrJzcYNvR7XmfeQPeM4JvWg7JxEakNJU+KOyvJTb3kiFhQtZzcmsZTiyPENTW+AGKbdAOVkOU/YixaV87z16b1Xfh6ufKHjeBtOEGkZSJSq82AegGcgPjIPErmrpVDOJjerzgxF35HBbwWGG9YQrX5uq1ZggyyGplW1PHm/qzoVihx1+SQ86LYiO9FiPY6CV+YIh8gmQU39mtmPLJaHWhVO8JvhQFjLFSEmLw6aKJKl/Q6+eheuKhVoZphLxtQGk7is2TeFUik00nzhe0C5jQ863d6L+YNmTlJ1mCRjz3JGmSwfH2V63CjCVJ29vQxYBHZ8ZA3MyhTxjPZj5ogXNk7JNgMd2hyiw7WPkfT89u2h1VZjtJxa5QClp
X-Exchange-RoutingPolicyChecked:
	NJL26boSp2SUNaQKqFBwDke68Q9w+bCvO7mNV6rHcMI3zgugCC6nyp2Ifldwbgpdj9kfSmWiAs7yzCKoGU7msmjnn0ZVyAPLg+7nRO2BZMGutfJS+wms6LUrkQzi6mwDO/b7kndApK+b81TAAUjIiNh45MQs5fFrFNP33wki/naNCDMCuery/mV8+GWOBqggN47a5u0xXXNcbX6EqA41lZMsrwgqBCH799N9Ls+hmpCbo1aed4U2xlb6OfBEPjIesD/I7qyownmcXm6f6DmHSX9B29oB4AvpDp9+sObFyruDw6+jM08SzUIB36+DOCZUYiFvMYdZ1S8rWvvOmRpoXA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:16:21.2182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa6c26c-40b0-432e-46e7-08def6f255aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4351
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX87Z0IHx4TXpw
 z2H4f9ecsvDovmnboYckaOMEol5jcPenLaSw6WwC6tD1bzfvaSsyfO85MYNS2SSCC1JMxP4qr4s
 MeSlJH+Km4vPg8ihdbYXdHS8BJ/fOv5HcorcRCpDxoDEbsDG6KeG5JzG2aMPXWJTMd6zFBqU0bm
 U9x5RGzCoylVr9rUA86L3aGbJnbnQIrfd9W3cD+QGhRPyowtXgxpbjnMyLsaqGaHE5PtWkqCc4k
 xliBB0TFDMJndzrzBhvdfa0+a/ZG3BODpS+osxBmYbivdITknu8If7MJiVSM2j8iFzebGyNxPO9
 80TvhonLc2yExyRl/WBBsWnoNpvOwU5HNRXypnPJQL8HXJ9aY16XH03xxUe10AksXs4KyvDaHUY
 OZDinD99ULFJv5SQX14yLRWMfsiy1NMUcaHE8kyZWxOYm3s1HIez/wqh6F6fkBhfObxqgyAYqAC
 oVdrFA3f61YKnWiMOrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX2715e5Jn6qGI
 gkQzqisLLuc+PiaYzfWfcMl77vfHo0WPm4VGpbWCwUeQ+wwpkqTNUFcNdhYgZbgKi7gyu+Yi4zF
 F708EVxlTlATJWpiMXL+K4bgTmyFquU=
X-Proofpoint-GUID: O4n0KBZ8Yirb3zNi5JwQqOJcLVxqnEom
X-Proofpoint-ORIG-GUID: O4n0KBZ8Yirb3zNi5JwQqOJcLVxqnEom
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eb48 cx=c_pps
 a=Whz0XdwTh4CxRjET/SubaQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=awo6gdX1Wv1SqJAOH5YA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

The `__udma_reserve_##res` macro currently lacks a bounds check for
the provided `id`. If a caller passes an ID exceeding the resource
count (`ud->res##_cnt`), `test_bit()` performs an out-of-bounds
memory access on the bitmap.

Additionally, the macro returns `-ENOENT` when a resource is already
in use, which is semantically incorrect. The logging logic is also
broken, printing the literal "res##<id>" instead of the resource
name.

Update the macro to:
1. Validate `id` against `ud->res##_cnt` and return `-EINVAL` if out
   of bounds.
2. Return `-EBUSY` instead of `-ENOENT` when a resource is already
   reserved, correctly reflecting the resource state.
3. Use the stringification operator `#res` to correctly print the
   resource name (e.g., "tchan") in error messages.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index d5d7158a37f8f..381e1a30c0be7 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2016,9 +2016,14 @@ struct udma_##res *__udma_reserve_##res(struct udma_dev *ud,	\
 					       int id)			\
 {									\
 	if (id >= 0) {							\
+		if (id >= ud->res##_cnt) {				\
+			dev_err(ud->dev,				\
+				#res " id %d is out of bounds.\n", id);	\
+			return ERR_PTR(-EINVAL);			\
+		}							\
 		if (test_bit(id, ud->res##_map)) {			\
-			dev_err(ud->dev, "res##%d is in use\n", id);	\
-			return ERR_PTR(-ENOENT);			\
+			dev_err(ud->dev, #res "%d is in use\n", id);	\
+			return ERR_PTR(-EBUSY);			\
 		}							\
 	} else {							\
 		int start;						\
-- 
2.54.0

