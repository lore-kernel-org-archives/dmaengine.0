Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEA7411FA1;
	Mon, 10 Aug 2026 15:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374981; cv=fail; b=p8Htx4cxkInY5ooziZtcp0qXz3qS8KG8cBV5Mlp6Ira1IcGrE8ht7uBoa5F12fIDK355Gh3u4obrw8e9n/9lxubWcRFe/E6kNZSjuaQlpo+r3f7tIrcoXtHucUcG7MUxk9wuk7JQKmqmJm/2M7/bSDCGV/1TNc3IdsId3NhVrIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374981; c=relaxed/simple;
	bh=pLOJm7GJ1lL9Pbs1y9MEJX3eSGrVDwRJ3TxK2nPMC34=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIeWccVXgPnv4UjsUuBvCJ0Mh6GmJ11QDBAKR3TVZptE3H6qSB4ojOuM+09T6CvvKeGypRBSeqQlTrTJyO+4PNjapzZfB6avV42AlM6BLYY8wkXnao0+wSNQxvzFHF24YMfH2oAPUtHUQ8ZPmmfcShTgtGEU7o0xXvWRxjZwHM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qlxMfc1A; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HyFV9UAl; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qlxMfc1A";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HyFV9UAl"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUadP3620312;
	Mon, 10 Aug 2026 10:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=j8A0s5SduLH7r+Jfoxbvq/oU+d3WTQh3eOy1gLfk7
	2g=; b=qlxMfc1A/B7Hpb9yqs0tklSLoOHkWM3HrmEFA7xH0kjRYMY+xnxTjnCMO
	apq1tws7KL9tF0quoiEnoW7EDHYMwaPxfxSh5pnlgmW+2y7Hm32gSCE6UTZ4+eXq
	L4d2eMuGY1Xt6luEnYPI+ZaffMV0BGpnddXQsmCtcQOjlDsyaXs0n/O/zGsl4r5S
	Cb7cObNZ8S11ZU4kxnqXKMiI+wodczSmJlpxrrfk6bNxi3iGys2CK0RGdwFsopnK
	40QC1y2KcpbkHjKPkVNIC/lhzLLSNAAGJaA8g80Ucr2ihbB80MDVZTtNz5GIZ9K9
	MgchzFqud84d9FHf3UuwjOItwhU1g==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79h5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WAvpHqzTit0RiRhtyFBFbVamrCMQm8SsQYpO+P8h1KeHXjjWfO/WH+v7j8Q3yJkOfti42eLPF9O2alYd3vmh2CYb/QLK291odjdfPeGClE8CH38OCo6160YYRHgVwpkoH4bT/zqRnLehi/xI64WONT1bP3B6u5FriOuJllDV0Z/szpMu8FhrDj8Wdi94iXiVA3WnQSz48oy3y5R/OucN7fkKJSxjsOLurQdi0muAguxIbZqC9DIvSumxr9G9FWHx8hDaZpIGAV4r7Fo/mmjCXdI1WuVBAAjiC+FIuQCdczos/nzZXx6QTal5GV+8lxSX1UWzsBOidpRf/bQ8uatytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8A0s5SduLH7r+Jfoxbvq/oU+d3WTQh3eOy1gLfk72g=;
 b=O8QfNxGu+PWYwGqWssm+d8zRHKey7zNhjoTvWwJW0eToEeHPcuN8o6M82ULrzC7X6TMikMWBPDOrFi1OUBwATOpkInQWSgHQSuvaHEqQOw33K6G2/uGdPsMFbuOWeeWUxtLDDmt6i8agf5a6ExHlHx9Z7I7CQsJohe7hGbjXyD9d0ULzT0u66iprOVLttEolSydnv641T+fYpNSPoNvXayOVxvVmvz6mpZae22e3XEM0rAiE8TcBY/AkeI3Q7f8lJP1C84aGhSrOz57F5Dtb8qvdsu/7Ll+JH7bUHT+j+X1LC0MkMZGGdy1gmOENJTGvizvxcZNKS5sgzlujesjhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8A0s5SduLH7r+Jfoxbvq/oU+d3WTQh3eOy1gLfk72g=;
 b=HyFV9UAlbB4x8JQPWZh07VaXwpd2WBP9gTOHI9UibHYQn41G768+fcAaIM0+GizaahO3aS/jIzldEXj00AX7i9ud/xhdMxR3X1JwT7Ff8ugAqztc+8R9bpJ3A/k5aEWdOO1+9hu1nBi69GkW1yZIcGZeWwDqCoPT649RCjZ80dw=
Received: from SJ0PR13CA0137.namprd13.prod.outlook.com (2603:10b6:a03:2c6::22)
 by IA3PR10MB8492.namprd10.prod.outlook.com (2603:10b6:208:580::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 10 Aug
 2026 15:15:50 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::35) by SJ0PR13CA0137.outlook.office365.com
 (2603:10b6:a03:2c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 15:15:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:44 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:44 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:44 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:44 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERWB2648613;
	Mon, 10 Aug 2026 10:15:39 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 16/19] dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2
Date: Mon, 10 Aug 2026 20:44:10 +0530
Message-ID: <20260810151423.1948224-17-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|IA3PR10MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: ae99c251-cb95-4ca2-16c3-08def6f2401a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|82310400026|1800799024|13003099007|921020|6133799003|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	iSXEIqQOBQwNSJtT2iEt199rQecRKuPmFevRNaz72rFhR8M4Wh4UfMlSjRpzDYukyLQWX3Q+bcYFyewgcl8bQHu/5XsGb76lX4wl5qNqm83+y/AUSyVJMmiiVkMFNBP70KPgpiE3bg5c1iaw6SEGr0zSXGhYW0tR8NKTx8Oypqsvs+Pa5PPjXAqHQmwBQv5b1VCeqviyDgOHHvTGLLClwp8Vmc2R5NWUCmHvWcIZMuMhkX+GJwmlG166Jw5NYg91T3slc4iyCujOB7nTaSy2NY2Uey71Tyea9MVW99728WcJsQ848Pqz2FybFyTnJET5C2Kst0KFg2uEusanME7H1oWtfeyeuJZ8SfnsLnCskOj23CgbLNfhljLFIAr5CpJ25w7YrosHc/2PogmyYTraiDVt/Q0ZxDSwWOVF79PZdSKas9gI95M8DHuXTlqoRsYXLPr2rFv7uDXQEOJ4TiBp4uziBTOJsVEqzxyqy2Ru7ja8EnEJ5NSw0y/ypUdsbV8+OS7UdNpn+IRDpCHfPoKg5K862GUEu5V3eXcwlXk87cT8dSbA2IjWF/+vLOKewYwGIqExuRszfVxHdeX/IRtFhRHxgibIvMTU02FmnfH/JBE5JJCYnWbJRHHXJGeQi6d+PZSY2isri8bOhfmrAYXT9MYg3qWUesSLVTv2nsQF4mKRacWbY7GcD1Uw7OU5AqKt
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(82310400026)(1800799024)(13003099007)(921020)(6133799003)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MDTQgqfpFDx0c+O7ja9EUjKrNxAg88dvDOHMGVzysBHnHBlTvNQdz+QE/QRI0lMyaTzUzMo2vbPARGQzdxCjpUWtCWXCiJt0CaYiwF7pml/iU4M6Ld0CgAiofSwfzyb9aU13CS39JLqZYm4Dbovdlcqy1ati6b4qt2ow3skCFu6CrXRmMTHtmctwQU/pSM6bQJaWzwe47PJfUZsc7elsXzrPgkWSOChx0DIloUYePY1kEICiMssoQoyweuUyVf0p58l+FW9WNhwhmwwvrbZvdrVcW4p+PA5KJ2COjzNRAlozIKroxoRfUYHg8shKq5lQJSTLzxZLGLtLDges8UvHRjYRoKG3p3TFkMWmNo5wzXTEohsJgfLZUHCl8QYmEFb5r5fZNMe45c2mDRGERxza7w3X4IGX8JjbMGK8OEYpEViapResZRHXij/XAYIMTNbi
X-Exchange-RoutingPolicyChecked:
	JVK6ovni6MIuqpl6mfVLZr78UgRqEXbmQvRzXONs/eygPI0gvSyJA3BfJLYT2/epV43f5CPs7kdgLxgscmcnZ8dkRLU/D0OWN0m1T+cueB/1+ZMsXbKO9HTQePB9uuP683sj9cEjgortabEg1ElfidPMHFVqEO7SD2ORrMtgsoBEjmXECWpc6ZKoUgMzRzBR0NX09HdZ+UBrY4utgd75cCfAC04uBhvs+T6bkKQI5JATgEs2xbP0eeZgrg4AG/zJy5xOVAV3KZQsQwwhxGBmqCFiHLBnFhGcuN3an1RcvgjZPGOq78ah+C9DHFphBpztXP4Pnzh6XnDzzCiNgBzTpw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:44.9812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae99c251-cb95-4ca2-16c3-08def6f2401a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8492
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX+4bqkgDTZDQ+
 Y9YR/oN0qBDnSzgrAVsVDdhW0uV0OdGjaCyNGIe17eBb0Ppo6SUy4TlpGb/orQKgwApYUbKDZrl
 QNmC1nRn+aALs7zZ48Y81KfC+TsVcc0N+uZeZJTYvRHUmnLpVbRwxnlamzYqEUpl4banTn1diRm
 3O/1jZ8ZLcHt9ZQ87ZFhspZAIBFoummsRT7FFYFpRqMsEgcMbhW4pAWNd7vD+o0aWpkbb8fExOE
 QrpeMGtsuG8NcvkQbke93IfM2S6XlR7ty4aoExzdZk3W1dk+FdRLGct/Qub9u462eXpakwcv9xb
 4EmqxACsWUcvcyjCMwkm2U/D5ep2MJ9I3Un+RD/jjg7N+xlBhBtU5WmDDkH2641thx/VmOz0btT
 VusGKjcrCH1LgIjVft5jEso1/r1hynXhT/iF/Y91uAFlRyavCoYqsaWhSdOhVb2yTIhtNPmfSUM
 C6qxUo6W+x96yY5IR/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX2MeGgiy9qlXD
 LB6mM7U7a5Rr52zXnh6Cb01cJJvv3l9yOyB9Tz4dPoSHB/ENCYtGwvXaZl2HaOP0NQ5tPjNlJbi
 ItRfiHsxNzmvBZmDsw+LA/HN8OmBWYg=
X-Proofpoint-GUID: ug7HugvsErdSoOvTwOHfJp604Gy3mWSg
X-Proofpoint-ORIG-GUID: ug7HugvsErdSoOvTwOHfJp604Gy3mWSg
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eb2d cx=c_pps
 a=ufjbz8VI8KEHvjFw3VA2nw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=gedxhmekW7z0cqXWnrIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Add support for BCDMA_V2.

The BCDMA_V2 is different than the existing BCDMA supported by the
k3-udma driver.

The changes in BCDMA_V2 are:
- Autopair: There is no longer a need for PSIL pair and AUTOPAIR bit
  needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to PEER
  registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Also, since a version member is introduced in the match_data, Add
version v1 in match_data of SoCs using v1 DMA.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Kconfig            |   14 +-
 drivers/dma/ti/Makefile           |    1 +
 drivers/dma/ti/k3-udma-common.c   |   91 +-
 drivers/dma/ti/k3-udma-v2.c       | 1319 +++++++++++++++++++++++++++++
 drivers/dma/ti/k3-udma.c          |    9 +
 drivers/dma/ti/k3-udma.h          |  123 +--
 include/linux/soc/ti/k3-ringacc.h |    3 +
 7 files changed, 1488 insertions(+), 72 deletions(-)
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

diff --git a/drivers/dma/ti/Kconfig b/drivers/dma/ti/Kconfig
index 712e456015459..40713bd1e8e9b 100644
--- a/drivers/dma/ti/Kconfig
+++ b/drivers/dma/ti/Kconfig
@@ -49,6 +49,18 @@ config TI_K3_UDMA
 	  Enable support for the TI UDMA (Unified DMA) controller. This
 	  DMA engine is used in AM65x and j721e.
 
+config TI_K3_UDMA_V2
+	tristate "Texas Instruments K3 UDMA v2 support"
+	depends on ARCH_K3
+	select DMA_ENGINE
+	select DMA_VIRTUAL_CHANNELS
+	select TI_K3_UDMA_COMMON
+	select TI_K3_RINGACC
+	select TI_K3_PSIL
+        help
+	  Enable support for the TI UDMA (Unified DMA) v2 controller. This
+	  DMA engine is used in AM62L.
+
 config TI_K3_UDMA_COMMON
 	tristate
 	default n
@@ -63,7 +75,7 @@ config TI_K3_UDMA_GLUE_LAYER
 
 config TI_K3_PSIL
        tristate
-       default TI_K3_UDMA
+       default TI_K3_UDMA || TI_K3_UDMA_V2
 
 config TI_DMA_CROSSBAR
 	bool
diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index 41bfba944dc6c..296aa3421e71b 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_TI_CPPI41) += cppi41.o
 obj-$(CONFIG_TI_EDMA) += edma.o
 obj-$(CONFIG_DMA_OMAP) += omap-dma.o
 obj-$(CONFIG_TI_K3_UDMA) += k3-udma.o
+obj-$(CONFIG_TI_K3_UDMA_V2) += k3-udma-v2.o
 obj-$(CONFIG_TI_K3_UDMA_COMMON) += k3-udma-common.o
 obj-$(CONFIG_TI_K3_UDMA_GLUE_LAYER) += k3-udma-glue.o
 k3-psil-lib-objs := k3-psil.o \
diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index 01b66e9f026b4..f9dd6edf3eacb 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -171,8 +171,13 @@ bool udma_is_desc_really_done(struct udma_chan *uc, struct udma_desc *d)
 	    uc->config.dir != DMA_MEM_TO_DEV || !(uc->config.tx_flags & DMA_PREP_INTERRUPT))
 		return true;
 
-	peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
-	bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+	if (uc->ud->match_data->version == K3_UDMA_V1) {
+		peer_bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_PEER_BCNT_REG);
+		bcnt = udma_tchanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+	} else {
+		peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
+		bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+	}
 
 	/* Transfer is incomplete, store current residue and time stamp */
 	if (peer_bcnt < bcnt) {
@@ -319,6 +324,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
 	size_t tr_size;
 	int num_tr = 0;
 	int tr_idx = 0;
+	u32 extra_flags = 0;
 	u64 asel;
 
 	/* estimate the number of TRs we will need */
@@ -342,6 +348,16 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
 	else
 		asel = (u64)uc->config.asel << K3_ADDRESS_ASEL_SHIFT;
 
+	/*
+	 * BCDMA V2 stalls and stops processing further TRs if a TR's ICNT0
+	 * is not a multiple of 16 bytes. Setting EOP on every TR (not just
+	 * the last one) avoids that stall condition. Intentional, not a bug.
+	 */
+	if (uc->ud->match_data->type == DMA_TYPE_BCDMA &&
+	    uc->ud->match_data->version == K3_UDMA_V2 &&
+	    dir == DMA_MEM_TO_DEV)
+		extra_flags = CPPI5_TR_CSF_EOP;
+
 	tr_req = d->hwdesc[0].tr_req_base;
 	for_each_sg(sgl, sgent, sglen, i) {
 		dma_addr_t sg_addr = sg_dma_address(sgent);
@@ -358,7 +374,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
 
 		cppi5_tr_init(&tr_req[tr_idx].flags, CPPI5_TR_TYPE1, false,
 			      false, CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
-		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT);
+		cppi5_tr_csf_set(&tr_req[tr_idx].flags, CPPI5_TR_CSF_SUPR_EVT | extra_flags);
 
 		sg_addr |= asel;
 		tr_req[tr_idx].addr = sg_addr;
@@ -372,7 +388,7 @@ udma_prep_slave_sg_tr(struct udma_chan *uc, struct scatterlist *sgl,
 				      false, false,
 				      CPPI5_TR_EVENT_SIZE_COMPLETION, 0);
 			cppi5_tr_csf_set(&tr_req[tr_idx].flags,
-					 CPPI5_TR_CSF_SUPR_EVT);
+					 CPPI5_TR_CSF_SUPR_EVT | extra_flags);
 
 			tr_req[tr_idx].addr = sg_addr + tr0_cnt1 * tr0_cnt0;
 			tr_req[tr_idx].icnt0 = tr1_cnt0;
@@ -593,7 +609,7 @@ int udma_configure_statictr(struct udma_chan *uc, struct udma_desc *d,
 			    enum dma_slave_buswidth dev_width,
 			    u16 elcnt)
 {
-	if (uc->config.ep_type != PSIL_EP_PDMA_XY)
+	if (uc->config.ep_type != PSIL_EP_PDMA_XY && uc->config.ep_type != PSIL_EP_PDMA_XYMF)
 		return 0;
 
 	/* Bus width translates to the element size (ES) */
@@ -951,7 +967,8 @@ udma_prep_dma_cyclic_tr(struct udma_chan *uc, dma_addr_t buf_addr,
 	 * As we are in cyclic mode, we do not know which period might be the
 	 * last one, so set the flag for each period.
 	 */
-	if (uc->config.ep_type == PSIL_EP_PDMA_XY &&
+	if ((uc->config.ep_type == PSIL_EP_PDMA_XY ||
+	    uc->config.ep_type == PSIL_EP_PDMA_XYMF) &&
 	    uc->ud->match_data->type == DMA_TYPE_BCDMA) {
 		period_csf = CPPI5_TR_CSF_EOP;
 	}
@@ -2052,6 +2069,8 @@ int udma_get_tchan(struct udma_chan *uc)
 		uc->tchan = NULL;
 		return ret;
 	}
+	if (ud->match_data->version == K3_UDMA_V2)
+		uc->chan = uc->tchan;
 
 	if (ud->tflow_cnt) {
 		int tflow_id;
@@ -2102,6 +2121,8 @@ int udma_get_rchan(struct udma_chan *uc)
 		uc->rchan = NULL;
 		return ret;
 	}
+	if (ud->match_data->version == K3_UDMA_V2)
+		uc->chan = uc->rchan;
 
 	return 0;
 }
@@ -2383,9 +2404,16 @@ static int bcdma_setup_resources(struct udma_dev *ud)
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
 	/* BCDMA do not really have flows, but the driver expect it */
 	ud->rflow_in_use = devm_kcalloc(dev, BITS_TO_LONGS(ud->rchan_cnt),
 					sizeof(unsigned long),
@@ -2480,11 +2508,18 @@ int k3_udma_setup_resources(struct udma_dev *ud)
 	if (ret)
 		return ret;
 
-	ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
-	if (ud->bchan_cnt)
-		ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
-	ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
-	ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
+	if (ud->match_data->version == K3_UDMA_V1) {
+		ch_count  = ud->bchan_cnt + ud->tchan_cnt + ud->rchan_cnt;
+		if (ud->bchan_cnt)
+			ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
+		ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
+		ch_count -= bitmap_weight(ud->rchan_map, ud->rchan_cnt);
+	} else {
+		ch_count = ud->bchan_cnt + ud->tchan_cnt;
+		if (ud->bchan_cnt)
+			ch_count -= bitmap_weight(ud->bchan_map, ud->bchan_cnt);
+		ch_count -= bitmap_weight(ud->tchan_map, ud->tchan_cnt);
+	}
 	if (!ch_count)
 		return -ENODEV;
 
@@ -2506,15 +2541,25 @@ int k3_udma_setup_resources(struct udma_dev *ud)
 						       ud->rflow_cnt));
 		break;
 	case DMA_TYPE_BCDMA:
-		dev_info(dev,
-			 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
-			 ch_count,
-			 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
-						       ud->bchan_cnt),
-			 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
-						       ud->tchan_cnt),
-			 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
-						       ud->rchan_cnt));
+		if (ud->match_data->version == K3_UDMA_V1) {
+			dev_info(dev,
+				 "Channels: %d (bchan: %u, tchan: %u, rchan: %u)\n",
+				 ch_count,
+				 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
+							       ud->bchan_cnt),
+				 ud->tchan_cnt - bitmap_weight(ud->tchan_map,
+							       ud->tchan_cnt),
+				 ud->rchan_cnt - bitmap_weight(ud->rchan_map,
+							       ud->rchan_cnt));
+		} else {
+			dev_info(dev,
+				 "Channels: %d (bchan: %u, chan: %u)\n",
+				 ch_count,
+				 ud->bchan_cnt - bitmap_weight(ud->bchan_map,
+							       ud->bchan_cnt),
+				 ud->chan_cnt - bitmap_weight(ud->chan_map,
+							      ud->chan_cnt));
+		}
 		break;
 	case DMA_TYPE_PKTDMA:
 		dev_info(dev,
diff --git a/drivers/dma/ti/k3-udma-v2.c b/drivers/dma/ti/k3-udma-v2.c
new file mode 100644
index 0000000000000..b9ce58d1934a9
--- /dev/null
+++ b/drivers/dma/ti/k3-udma-v2.c
@@ -0,0 +1,1319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Derived from K3 UDMA driver (k3-udma.c)
+ *  Copyright (C) 2024-2025 Texas Instruments Incorporated - http://www.ti.com
+ *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+ *  Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/dmapool.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/list.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/sys_soc.h>
+#include <linux/of.h>
+#include <linux/of_dma.h>
+#include <linux/of_irq.h>
+#include <linux/workqueue.h>
+#include <linux/completion.h>
+#include <linux/iopoll.h>
+#include <linux/soc/ti/k3-ringacc.h>
+
+#include "../virt-dma.h"
+#include "k3-udma.h"
+#include "k3-psil-priv.h"
+
+static const char * const v2_mmr_names[] = {
+	[V2_MMR_GCFG] = "gcfg",
+	[V2_MMR_BCHANRT] = "bchanrt",
+	[V2_MMR_CHANRT] = "chanrt",
+};
+
+static int udma_v2_check_chan_autopair_completion(struct udma_chan *uc)
+{
+	u32 val;
+
+	val = udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
+	if (val & UDMA_CHAN_RT_CTL_PAIR_TIMEOUT)
+		return -ETIMEDOUT;
+	else if (val & UDMA_CHAN_RT_CTL_PAIR_COMPLETE)
+		return 1;
+
+	/* timeout didn't occur and also pairing didn't happen yet. */
+	return 0;
+}
+
+static bool udma_v2_is_chan_paused(struct udma_chan *uc)
+{
+	u32 val, pause_mask;
+
+	if (uc->config.dir == DMA_MEM_TO_MEM) {
+		val = udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
+		pause_mask = UDMA_CHAN_RT_CTL_PAUSE;
+	} else {
+		val = udma_chanrt_read(uc, UDMA_CHAN_RT_PDMA_STATE_REG);
+		pause_mask = UDMA_CHAN_RT_PDMA_STATE_PAUSE;
+	}
+
+	if (val & pause_mask)
+		return true;
+
+	return false;
+}
+
+static void udma_v2_decrement_byte_counters(struct udma_chan *uc, u32 val)
+{
+	udma_chanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
+	udma_chanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
+	if (uc->config.ep_type != PSIL_EP_NATIVE)
+		udma_chanrt_write(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG, val);
+}
+
+static void udma_v2_reset_counters(struct udma_chan *uc)
+{
+	u32 val;
+
+	val = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+	udma_chanrt_write(uc, UDMA_CHAN_RT_BCNT_REG, val);
+
+	val = udma_chanrt_read(uc, UDMA_CHAN_RT_SBCNT_REG);
+	udma_chanrt_write(uc, UDMA_CHAN_RT_SBCNT_REG, val);
+
+	val = udma_chanrt_read(uc, UDMA_CHAN_RT_PCNT_REG);
+	udma_chanrt_write(uc, UDMA_CHAN_RT_PCNT_REG, val);
+
+	if (!uc->bchan) {
+		val = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
+		udma_chanrt_write(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG, val);
+	}
+}
+
+static int udma_v2_reset_chan(struct udma_chan *uc, bool hard)
+{
+	udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG, 0);
+
+	/* Reset all counters */
+	udma_v2_reset_counters(uc);
+
+	/* Hard reset: re-initialize the channel to reset */
+	if (hard) {
+		struct udma_chan_config ucc_backup;
+		int ret;
+
+		memcpy(&ucc_backup, &uc->config, sizeof(uc->config));
+		uc->ud->ddev.device_free_chan_resources(&uc->vc.chan);
+
+		/* restore the channel configuration */
+		memcpy(&uc->config, &ucc_backup, sizeof(uc->config));
+		ret = uc->ud->ddev.device_alloc_chan_resources(&uc->vc.chan);
+		if (ret)
+			return ret;
+
+		/*
+		 * Setting forced teardown after forced reset helps recovering
+		 * the rchan.
+		 */
+		if (uc->config.dir == DMA_DEV_TO_MEM)
+			udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
+						UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN |
+						UDMA_CHAN_RT_CTL_FTDOWN,
+						UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN |
+						UDMA_CHAN_RT_CTL_FTDOWN);
+	}
+	uc->state = UDMA_CHAN_IS_IDLE;
+
+	return 0;
+}
+
+static int udma_v2_start(struct udma_chan *uc)
+{
+	struct virt_dma_desc *vd = vchan_next_desc(&uc->vc);
+	struct udma_dev *ud = uc->ud;
+	int status;
+
+	if (!vd) {
+		uc->desc = NULL;
+		return -ENOENT;
+	}
+
+	list_del(&vd->node);
+
+	uc->desc = to_udma_desc(&vd->tx);
+
+	/* Channel is already running and does not need reconfiguration */
+	if (udma_is_chan_running(uc) && !udma_chan_needs_reconfiguration(uc)) {
+		udma_start_desc(uc);
+		goto out;
+	}
+
+	/* Make sure that we clear the teardown bit, if it is set */
+	ud->reset_chan(uc, false);
+
+	/* Push descriptors before we start the channel */
+	udma_start_desc(uc);
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		/* Config remote TR */
+		if (uc->config.ep_type == PSIL_EP_PDMA_XY ||
+		    uc->config.ep_type == PSIL_EP_PDMA_XYMF) {
+			u32 val = PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
+				  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
+			const struct udma_match_data *match_data =
+							uc->ud->match_data;
+
+			if (uc->config.enable_acc32)
+				val |= PDMA_STATIC_TR_XY_ACC32;
+			if (uc->config.enable_burst)
+				val |= PDMA_STATIC_TR_XY_BURST;
+
+			udma_chanrt_write(uc,
+					  UDMA_CHAN_RT_STATIC_TR_XY_REG,
+					  val);
+
+			udma_chanrt_write(uc,
+					  UDMA_CHAN_RT_STATIC_TR_Z_REG,
+					  PDMA_STATIC_TR_Z(uc->desc->static_tr.bstcnt,
+							   match_data->statictr_z_mask));
+
+			/* save the current staticTR configuration */
+			memcpy(&uc->static_tr, &uc->desc->static_tr,
+			       sizeof(uc->static_tr));
+		}
+
+		if (uc->config.ep_type == PSIL_EP_PDMA_XYMF)
+			udma_chanrt_write(uc, UDMA_CHAN_RT_FIFO_SEL_REG, uc->config.fifo_id);
+
+		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
+				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
+
+		/* Poll for autopair completion */
+		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
+					 status, status != 0, 100, 500, false, uc);
+
+		if (status <= 0)
+			return -ETIMEDOUT;
+
+		break;
+	case DMA_MEM_TO_DEV:
+		/* Config remote TR */
+		if (uc->config.ep_type == PSIL_EP_PDMA_XY ||
+		    uc->config.ep_type == PSIL_EP_PDMA_XYMF) {
+			u32 val = PDMA_STATIC_TR_Y(uc->desc->static_tr.elcnt) |
+				  PDMA_STATIC_TR_X(uc->desc->static_tr.elsize);
+
+			if (uc->config.enable_acc32)
+				val |= PDMA_STATIC_TR_XY_ACC32;
+			if (uc->config.enable_burst)
+				val |= PDMA_STATIC_TR_XY_BURST;
+
+			udma_chanrt_write(uc,
+					  UDMA_CHAN_RT_STATIC_TR_XY_REG,
+					  val);
+
+			/* save the current staticTR configuration */
+			memcpy(&uc->static_tr, &uc->desc->static_tr,
+			       sizeof(uc->static_tr));
+		}
+
+		if (uc->config.ep_type == PSIL_EP_PDMA_XYMF)
+			udma_chanrt_write(uc, UDMA_CHAN_RT_FIFO_SEL_REG, uc->config.fifo_id);
+
+		udma_chanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
+				  UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_AUTOPAIR);
+
+		/* Poll for autopair completion */
+		read_poll_timeout_atomic(udma_v2_check_chan_autopair_completion,
+					 status, status != 0, 100, 500, false, uc);
+
+		if (status <= 0)
+			return -ETIMEDOUT;
+
+		break;
+	case DMA_MEM_TO_MEM:
+		udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
+				   UDMA_CHAN_RT_CTL_EN);
+		udma_bchanrt_write(uc, UDMA_CHAN_RT_CTL_REG,
+				   UDMA_CHAN_RT_CTL_EN);
+
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	uc->state = UDMA_CHAN_IS_ACTIVE;
+out:
+
+	return 0;
+}
+
+static int udma_v2_stop(struct udma_chan *uc)
+{
+	uc->state = UDMA_CHAN_IS_TERMINATING;
+	reinit_completion(&uc->teardown_completed);
+
+	if (uc->config.dir == DMA_DEV_TO_MEM) {
+		if (!uc->cyclic && !uc->desc)
+			udma_push_to_ring(uc, -1);
+	}
+
+	if (uc->config.dir != DMA_MEM_TO_MEM)
+		udma_chanrt_write(uc, UDMA_CHAN_RT_PEER_REG(8), UDMA_CHAN_RT_PEER_REG8_FLUSH);
+
+	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
+				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN,
+				UDMA_CHAN_RT_CTL_EN | UDMA_CHAN_RT_CTL_TDOWN);
+
+	return 0;
+}
+
+static irqreturn_t udma_v2_udma_irq_handler(int irq, void *data)
+{
+	struct udma_chan *uc = data;
+	struct udma_dev *ud = uc->ud;
+	struct udma_desc *d;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		k3_ringacc_ring_clear_irq(uc->rflow->r_ring);
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		k3_ringacc_ring_clear_irq(uc->tchan->tc_ring);
+		break;
+	default:
+		return -ENOENT;
+	}
+
+	spin_lock(&uc->vc.lock);
+	d = uc->desc;
+	if (d) {
+		d->tr_idx = (d->tr_idx + 1) % d->sglen;
+
+		if (uc->cyclic) {
+			vchan_cyclic_callback(&d->vd);
+		} else {
+			/* TODO: figure out the real amount of data */
+			ud->decrement_byte_counters(uc, d->residue);
+			ud->start(uc);
+			vchan_cookie_complete(&d->vd);
+		}
+	}
+
+	spin_unlock(&uc->vc.lock);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t udma_v2_ring_irq_handler(int irq, void *data)
+{
+	struct udma_chan *uc = data;
+	struct udma_dev *ud = uc->ud;
+	struct udma_desc *d;
+	dma_addr_t paddr = 0;
+	u32 intr_status, reg;
+
+	switch (uc->config.dir) {
+	case DMA_DEV_TO_MEM:
+		intr_status =  k3_ringacc_ring_get_irq_status(uc->rflow->r_ring);
+		break;
+	case DMA_MEM_TO_DEV:
+	case DMA_MEM_TO_MEM:
+		intr_status =  k3_ringacc_ring_get_irq_status(uc->tchan->tc_ring);
+		break;
+	default:
+		return IRQ_NONE;
+	}
+
+	if (!intr_status)
+		return IRQ_NONE;	/* Not this channel's interrupt */
+
+	reg = udma_chanrt_read(uc, UDMA_CHAN_RT_CTL_REG);
+
+	if (intr_status & K3_RINGACC_RT_INT_STATUS_TR) {
+		/* check teardown status */
+		if ((reg & UDMA_CHAN_RT_CTL_TDOWN) && !(reg & UDMA_CHAN_RT_CTL_EN))
+			complete_all(&uc->teardown_completed);
+		udma_v2_udma_irq_handler(irq, data);
+
+		if (!(intr_status & K3_RINGACC_RT_INT_STATUS_COMPLETE))
+			return IRQ_HANDLED;
+	}
+
+	if (udma_pop_from_ring(uc, &paddr) || !paddr)
+		return IRQ_NONE;
+
+	spin_lock(&uc->vc.lock);
+
+	/* Teardown completion message */
+	if (cppi5_desc_is_tdcm(paddr)) {
+		complete_all(&uc->teardown_completed);
+
+		if (uc->terminated_desc) {
+			udma_desc_free(&uc->terminated_desc->vd);
+			uc->terminated_desc = NULL;
+		}
+
+		if (!uc->desc)
+			ud->start(uc);
+
+		goto out;
+	}
+
+	d = udma_udma_desc_from_paddr(uc, paddr);
+
+	if (d) {
+		dma_addr_t desc_paddr = udma_curr_cppi5_desc_paddr(d,
+								   d->desc_idx);
+		if (desc_paddr != paddr) {
+			dev_err(uc->ud->dev, "not matching descriptors!\n");
+			goto out;
+		}
+
+		if (d == uc->desc) {
+			/* active descriptor */
+			if (uc->cyclic) {
+				udma_cyclic_packet_elapsed(uc);
+				vchan_cyclic_callback(&d->vd);
+			} else {
+				if (udma_is_desc_really_done(uc, d)) {
+					ud->decrement_byte_counters(uc, d->residue);
+					ud->start(uc);
+					vchan_cookie_complete(&d->vd);
+				} else {
+					schedule_delayed_work(&uc->tx_drain.work,
+							      0);
+				}
+			}
+		} else {
+			/*
+			 * terminated descriptor, mark the descriptor as
+			 * completed to update the channel's cookie marker
+			 */
+			dma_cookie_complete(&d->vd.tx);
+		}
+	}
+out:
+	spin_unlock(&uc->vc.lock);
+
+	return IRQ_HANDLED;
+}
+
+static int bcdma_v2_get_bchan(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	enum udma_tp_level tpl;
+	int ret;
+
+	if (uc->bchan) {
+		dev_dbg(ud->dev, "chan%d: already have bchan%d allocated\n",
+			uc->id, uc->bchan->id);
+		return 0;
+	}
+
+	/*
+	 * Use normal channels for peripherals, and highest TPL channel for
+	 * mem2mem
+	 */
+	if (uc->config.tr_trigger_type)
+		tpl = 0;
+	else
+		tpl = ud->bchan_tpl.levels - 1;
+
+	/*
+	 * UDMA V2 uses a static 1:1 mapping between the virtual channel index
+	 * (uc->id) and the hardware bchan/tchan/rchan index -- unlike V1, which
+	 * dynamically allocates from a shared pool. Passing uc->id directly to
+	 * __udma_reserve_*() is intentional, not a bug.
+	 */
+	uc->bchan = __udma_reserve_bchan(ud, tpl, uc->id);
+	if (IS_ERR(uc->bchan)) {
+		ret = PTR_ERR(uc->bchan);
+		uc->bchan = NULL;
+		return ret;
+	}
+	uc->chan = uc->bchan;
+	uc->tchan = uc->bchan;
+
+	return 0;
+}
+
+static int bcdma_v2_alloc_bchan_resources(struct udma_chan *uc)
+{
+	struct k3_ring_cfg ring_cfg;
+	struct udma_dev *ud = uc->ud;
+	int ret;
+
+	ret = bcdma_v2_get_bchan(uc);
+	if (ret)
+		return ret;
+
+	ret = k3_ringacc_request_rings_pair(ud->ringacc, ud->match_data->chan_cnt + uc->id, -1,
+					    &uc->bchan->t_ring,
+					    &uc->bchan->tc_ring);
+	if (ret) {
+		ret = -EBUSY;
+		goto err_ring;
+	}
+
+	memset(&ring_cfg, 0, sizeof(ring_cfg));
+	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
+	ring_cfg.elm_size = K3_RINGACC_RING_ELSIZE_8;
+	ring_cfg.mode = K3_RINGACC_RING_MODE_RING;
+
+	k3_configure_chan_coherency(&uc->vc.chan, ud->asel);
+	ring_cfg.asel = ud->asel;
+	ring_cfg.dma_dev = dmaengine_get_dma_device(&uc->vc.chan);
+
+	ret = k3_ringacc_ring_cfg(uc->bchan->t_ring, &ring_cfg);
+	if (ret)
+		goto err_ringcfg;
+
+	return 0;
+
+err_ringcfg:
+	k3_ringacc_ring_free(uc->bchan->tc_ring);
+	uc->bchan->tc_ring = NULL;
+	k3_ringacc_ring_free(uc->bchan->t_ring);
+	uc->bchan->t_ring = NULL;
+	k3_configure_chan_coherency(&uc->vc.chan, 0);
+err_ring:
+	bcdma_put_bchan(uc);
+
+	return ret;
+}
+
+static int udma_v2_alloc_tx_resources(struct udma_chan *uc)
+{
+	struct k3_ring_cfg ring_cfg;
+	struct udma_dev *ud = uc->ud;
+	struct udma_tchan *tchan;
+	int ring_idx, ret;
+
+	ret = udma_get_tchan(uc);
+	if (ret)
+		return ret;
+
+	tchan = uc->tchan;
+	if (tchan->tflow_id >= 0)
+		ring_idx = tchan->tflow_id;
+	else
+		ring_idx = tchan->id;
+
+	ret = k3_ringacc_request_rings_pair(ud->ringacc, ring_idx, -1,
+					    &tchan->t_ring,
+					    &tchan->tc_ring);
+	if (ret) {
+		ret = -EBUSY;
+		goto err_ring;
+	}
+
+	memset(&ring_cfg, 0, sizeof(ring_cfg));
+	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
+	ring_cfg.elm_size = K3_RINGACC_RING_ELSIZE_8;
+	ring_cfg.mode = K3_RINGACC_RING_MODE_RING;
+
+	k3_configure_chan_coherency(&uc->vc.chan, uc->config.asel);
+	ring_cfg.asel = uc->config.asel;
+	ring_cfg.dma_dev = dmaengine_get_dma_device(&uc->vc.chan);
+
+	ret = k3_ringacc_ring_cfg(tchan->t_ring, &ring_cfg);
+	ret |= k3_ringacc_ring_cfg(tchan->tc_ring, &ring_cfg);
+
+	if (ret)
+		goto err_ringcfg;
+
+	return 0;
+
+err_ringcfg:
+	k3_ringacc_ring_free(uc->tchan->tc_ring);
+	uc->tchan->tc_ring = NULL;
+	k3_ringacc_ring_free(uc->tchan->t_ring);
+	uc->tchan->t_ring = NULL;
+err_ring:
+	udma_put_tchan(uc);
+
+	return ret;
+}
+
+static int udma_v2_alloc_rx_resources(struct udma_chan *uc)
+{
+	struct udma_dev *ud = uc->ud;
+	struct k3_ring_cfg ring_cfg;
+	struct udma_rflow *rflow;
+	int fd_ring_id;
+	int ret;
+
+	ret = udma_get_rchan(uc);
+	if (ret)
+		return ret;
+
+	/* For MEM_TO_MEM we don't need rflow or rings */
+	if (uc->config.dir == DMA_MEM_TO_MEM)
+		return 0;
+
+	if (uc->config.default_flow_id >= 0)
+		ret = udma_get_rflow(uc, uc->config.default_flow_id);
+	else
+		ret = udma_get_rflow(uc, uc->rchan->id);
+
+	if (ret) {
+		ret = -EBUSY;
+		goto err_rflow;
+	}
+
+	rflow = uc->rflow;
+	if (ud->tflow_cnt)
+		fd_ring_id = ud->tflow_cnt + rflow->id;
+	else
+		fd_ring_id = uc->rchan->id;
+	ret = k3_ringacc_request_rings_pair(ud->ringacc, fd_ring_id, -1,
+					    &rflow->fd_ring, &rflow->r_ring);
+	if (ret) {
+		ret = -EBUSY;
+		goto err_ring;
+	}
+
+	memset(&ring_cfg, 0, sizeof(ring_cfg));
+
+	ring_cfg.elm_size = K3_RINGACC_RING_ELSIZE_8;
+	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
+	ring_cfg.mode = K3_RINGACC_RING_MODE_RING;
+
+	k3_configure_chan_coherency(&uc->vc.chan, uc->config.asel);
+	ring_cfg.asel = uc->config.asel;
+	ring_cfg.dma_dev = dmaengine_get_dma_device(&uc->vc.chan);
+
+	ret = k3_ringacc_ring_cfg(rflow->fd_ring, &ring_cfg);
+
+	ring_cfg.size = K3_UDMA_DEFAULT_RING_SIZE;
+	ret |= k3_ringacc_ring_cfg(rflow->r_ring, &ring_cfg);
+
+	if (ret)
+		goto err_ringcfg;
+
+	return 0;
+
+err_ringcfg:
+	k3_ringacc_ring_free(rflow->r_ring);
+	rflow->r_ring = NULL;
+	k3_ringacc_ring_free(rflow->fd_ring);
+	rflow->fd_ring = NULL;
+err_ring:
+	udma_put_rflow(uc);
+err_rflow:
+	udma_put_rchan(uc);
+
+	return ret;
+}
+
+static int bcdma_v2_alloc_chan_resources(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	struct udma_dev *ud = to_udma_dev(chan->device);
+	struct platform_device *pdev = to_platform_device(ud->dev);
+	char irq_name[10];
+	u32 irq_ring_idx;
+	int ret;
+
+	/* Only TR mode is supported */
+	uc->config.pkt_mode = false;
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
+	case DMA_MEM_TO_MEM:
+		/* Non synchronized - mem to mem type of transfer */
+		dev_dbg(uc->ud->dev, "%s: chan%d as MEM-to-MEM\n", __func__,
+			uc->id);
+
+		ret = bcdma_v2_alloc_bchan_resources(uc);
+		if (ret)
+			return ret;
+
+		irq_ring_idx = ud->match_data->chan_cnt + uc->id;
+		break;
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
+		irq_ring_idx = uc->tchan->id;
+
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
+		irq_ring_idx = uc->rchan->id;
+
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
+	if (uc->config.dir == DMA_MEM_TO_MEM  && !uc->config.tr_trigger_type) {
+		uc->config.hdesc_size =
+			cppi5_trdesc_calc_size(sizeof(struct cppi5_tr_type15_t), 2);
+
+		uc->hdesc_pool = dma_pool_create(uc->name, ud->ddev.dev,
+						 uc->config.hdesc_size,
+						 ud->desc_align,
+						 0);
+		if (!uc->hdesc_pool) {
+			dev_err(ud->ddev.dev,
+				"Descriptor pool allocation failed\n");
+			uc->use_dma_pool = false;
+			ret = -ENOMEM;
+			goto err_res_free;
+		}
+
+		uc->use_dma_pool = true;
+	} else if (uc->config.dir != DMA_MEM_TO_MEM) {
+		uc->psil_paired = true;
+	}
+
+	INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
+
+	snprintf(irq_name, sizeof(irq_name), "chan%u", irq_ring_idx);
+	uc->irq_num_ring = platform_get_irq_byname(pdev, irq_name);
+	if (uc->irq_num_ring < 0) {
+		ret = uc->irq_num_ring;
+		goto err_res_free;
+	}
+
+	ret = request_irq(uc->irq_num_ring, udma_v2_ring_irq_handler,
+			  IRQF_SHARED | IRQF_TRIGGER_HIGH, uc->name, uc);
+	if (ret) {
+		dev_err(ud->dev, "chan%d: ring irq request failed\n", uc->id);
+		goto err_irq_free;
+	}
+
+	udma_reset_rings(uc);
+
+	return 0;
+
+err_irq_free:
+	uc->irq_num_ring = 0;
+	uc->irq_num_udma = 0;
+err_res_free:
+	bcdma_free_bchan_resources(uc);
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
+static enum dma_status udma_v2_tx_status(struct dma_chan *chan,
+					 dma_cookie_t cookie,
+					 struct dma_tx_state *txstate)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	enum dma_status ret;
+	unsigned long flags;
+
+	spin_lock_irqsave(&uc->vc.lock, flags);
+
+	ret = dma_cookie_status(chan, cookie, txstate);
+
+	if (!udma_is_chan_running(uc))
+		ret = DMA_COMPLETE;
+
+	if (ret == DMA_IN_PROGRESS && udma_v2_is_chan_paused(uc))
+		ret = DMA_PAUSED;
+
+	if (ret == DMA_COMPLETE || !txstate)
+		goto out;
+
+	if (uc->desc && uc->desc->vd.tx.cookie == cookie) {
+		u32 peer_bcnt = 0;
+		u32 bcnt = 0;
+		u32 residue = uc->desc->residue;
+		u32 delay = 0;
+
+		if (uc->desc->dir == DMA_MEM_TO_DEV) {
+			bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_SBCNT_REG);
+
+			if (uc->config.ep_type != PSIL_EP_NATIVE) {
+				peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
+
+				if (bcnt > peer_bcnt)
+					delay = bcnt - peer_bcnt;
+			}
+		} else if (uc->desc->dir == DMA_DEV_TO_MEM) {
+			bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+
+			if (uc->config.ep_type != PSIL_EP_NATIVE) {
+				peer_bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_PERIPH_BCNT_REG);
+
+				if (peer_bcnt > bcnt)
+					delay = peer_bcnt - bcnt;
+			}
+		} else {
+			bcnt = udma_chanrt_read(uc, UDMA_CHAN_RT_BCNT_REG);
+		}
+
+		if (bcnt && !(bcnt % uc->desc->residue))
+			residue = 0;
+		else
+			residue -= bcnt % uc->desc->residue;
+
+		if (!residue && (uc->config.dir == DMA_DEV_TO_MEM || !delay)) {
+			ret = DMA_COMPLETE;
+			delay = 0;
+		}
+
+		dma_set_residue(txstate, residue);
+		dma_set_in_flight_bytes(txstate, delay);
+
+	} else {
+		ret = DMA_COMPLETE;
+	}
+
+out:
+	spin_unlock_irqrestore(&uc->vc.lock, flags);
+	return ret;
+}
+
+static int udma_v2_pause(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	unsigned long flags;
+
+	/* pause the channel */
+	spin_lock_irqsave(&uc->vc.lock, flags);
+	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
+				UDMA_CHAN_RT_CTL_PAUSE, UDMA_CHAN_RT_CTL_PAUSE);
+	spin_unlock_irqrestore(&uc->vc.lock, flags);
+
+	return 0;
+}
+
+static int udma_v2_resume(struct dma_chan *chan)
+{
+	struct udma_chan *uc = to_udma_chan(chan);
+	unsigned long flags;
+
+	/* resume the channel */
+	spin_lock_irqsave(&uc->vc.lock, flags);
+	udma_chanrt_update_bits(uc, UDMA_CHAN_RT_CTL_REG,
+				UDMA_CHAN_RT_CTL_PAUSE, 0);
+	spin_unlock_irqrestore(&uc->vc.lock, flags);
+
+	return 0;
+}
+
+static struct platform_driver bcdma_v2_driver;
+
+static bool udma_v2_dma_filter_fn(struct dma_chan *chan, void *param)
+{
+	struct udma_v2_filter_param *filter_param;
+	struct psil_endpoint_config *ep_config;
+	struct udma_chan_config *ucc;
+	struct udma_chan *uc;
+	struct udma_dev *ud;
+
+	if (chan->device->dev->driver != &bcdma_v2_driver.driver)
+		return false;
+
+	uc = to_udma_chan(chan);
+	ucc = &uc->config;
+	ud = uc->ud;
+	filter_param = param;
+
+	if (filter_param->asel > 15) {
+		dev_err(ud->dev, "Invalid channel asel: %u\n",
+			filter_param->asel);
+		return false;
+	}
+
+	ucc->asel = filter_param->asel;
+	ucc->tr_trigger_type = filter_param->tr_trigger_type;
+
+	if (ucc->tr_trigger_type) {
+		ucc->dir = DMA_MEM_TO_MEM;
+		goto triggered_bchan;
+	} else {
+		u32 thread_id;
+		bool dev_to_mem;
+
+		ep_config = psil_get_ep_config_by_id(filter_param->channel_id,
+						      (ud->match_data->type == DMA_TYPE_PKTDMA),
+						      &thread_id, &dev_to_mem);
+		if (IS_ERR(ep_config)) {
+			dev_err(ud->dev, "No config for channel %u\n",
+				filter_param->channel_id);
+			ucc->atype = 0;
+			ucc->asel = 0;
+			return false;
+		}
+		ucc->remote_thread_id = thread_id;
+		ucc->dir = dev_to_mem ? DMA_DEV_TO_MEM : DMA_MEM_TO_DEV;
+	}
+	if (IS_ERR(ep_config)) {
+		dev_err(ud->dev, "No configuration for psi-l thread 0x%04x\n",
+			ucc->remote_thread_id);
+		ucc->dir = DMA_MEM_TO_MEM;
+		ucc->remote_thread_id = -1;
+		ucc->atype = 0;
+		ucc->asel = 0;
+		return false;
+	}
+
+	ucc->pkt_mode = ep_config->pkt_mode;
+	ucc->channel_tpl = ep_config->channel_tpl;
+	ucc->notdpkt = ep_config->notdpkt;
+	ucc->ep_type = ep_config->ep_type;
+	ucc->fifo_id = ep_config->fifo_id;
+
+	if (ud->match_data->version == K3_UDMA_V2 &&
+	    ep_config->mapped_channel_id >= 0) {
+		ucc->mapped_channel_id = ep_config->mapped_channel_id;
+		ucc->default_flow_id = ep_config->default_flow_id;
+	} else {
+		ucc->mapped_channel_id = -1;
+		ucc->default_flow_id = -1;
+	}
+
+	ucc->needs_epib = ep_config->needs_epib;
+	ucc->psd_size = ep_config->psd_size;
+	ucc->metadata_size =
+		(ucc->needs_epib ? CPPI5_INFO0_HDESC_EPIB_SIZE : 0) +
+		ucc->psd_size;
+
+	if (ucc->ep_type != PSIL_EP_NATIVE) {
+		const struct udma_match_data *match_data = ud->match_data;
+
+		if ((match_data->flags & UDMA_FLAG_PDMA_ACC32) && ep_config->pdma_acc32)
+			ucc->enable_acc32 = true;
+		else
+			ucc->enable_acc32 = false;
+
+		if ((match_data->flags & UDMA_FLAG_PDMA_BURST) && ep_config->pdma_burst)
+			ucc->enable_burst = true;
+		else
+			ucc->enable_burst = false;
+	}
+	if (ucc->pkt_mode)
+		ucc->hdesc_size = ALIGN(sizeof(struct cppi5_host_desc_t) +
+				 ucc->metadata_size, ud->desc_align);
+
+	dev_dbg(ud->dev, "chan%d: Remote thread: 0x%04x (%s)\n", uc->id,
+		ucc->remote_thread_id, dmaengine_get_direction_text(ucc->dir));
+
+	return true;
+
+triggered_bchan:
+	dev_dbg(ud->dev, "chan%d: triggered channel (type: %u)\n", uc->id,
+		ucc->tr_trigger_type);
+
+	return true;
+}
+
+static struct dma_chan *udma_v2_of_xlate(struct of_phandle_args *dma_spec,
+					 struct of_dma *ofdma)
+{
+	struct udma_dev *ud = ofdma->of_dma_data;
+	dma_cap_mask_t mask = ud->ddev.cap_mask;
+	struct udma_v2_filter_param filter_param;
+	struct dma_chan *chan;
+
+	if (ud->match_data->type == DMA_TYPE_BCDMA) {
+		if (dma_spec->args_count != 4)
+			return NULL;
+
+		filter_param.tr_trigger_type = dma_spec->args[0];
+		filter_param.trigger_param = dma_spec->args[1];
+		filter_param.channel_id = dma_spec->args[2];
+		filter_param.asel = dma_spec->args[3];
+	} else {
+		if (dma_spec->args_count != 1 && dma_spec->args_count != 2)
+			return NULL;
+
+		filter_param.channel_id = dma_spec->args[0];
+		filter_param.tr_trigger_type = 0;
+		if (dma_spec->args_count == 2)
+			filter_param.asel = dma_spec->args[1];
+		else
+			filter_param.asel = 0;
+	}
+
+	chan = __dma_request_channel(&mask, udma_v2_dma_filter_fn, &filter_param,
+				     ofdma->of_node);
+	if (!chan) {
+		dev_err(ud->dev, "get channel fail in %s.\n", __func__);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return chan;
+}
+
+static struct udma_match_data bcdma_v2_am62l_data = {
+	.type = DMA_TYPE_BCDMA,
+	.version = K3_UDMA_V2,
+	.psil_base = 0x2000, /* for tchan and rchan, not applicable to bchan */
+	.enable_memcpy_support = true, /* Supported via bchan */
+	.flags = UDMA_FLAGS_J7_CLASS,
+	.statictr_z_mask = GENMASK(23, 0),
+	.burst_size = {
+		TI_SCI_RM_UDMAP_CHAN_BURST_SIZE_64_BYTES, /* Normal Channels */
+		0, /* No H Channels */
+		0, /* No UH Channels */
+	},
+	.bchan_cnt = 16,
+	.chan_cnt = 128,
+	.tchan_cnt = 128,
+	.rchan_cnt = 128,
+};
+
+static const struct of_device_id udma_of_match[] = {
+	{
+		.compatible = "ti,am62l-dmss-bcdma",
+		.data = &bcdma_v2_am62l_data,
+	},
+	{ /* Sentinel */ },
+};
+
+static const struct soc_device_attribute k3_soc_devices[] = {
+	{ .family = "AM62LX", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, udma_of_match);
+
+static int udma_v2_get_mmrs(struct platform_device *pdev, struct udma_dev *ud)
+{
+	int i;
+
+	ud->mmrs[V2_MMR_GCFG] = devm_platform_ioremap_resource_byname(pdev,
+								      v2_mmr_names[V2_MMR_GCFG]);
+	if (IS_ERR(ud->mmrs[V2_MMR_GCFG]))
+		return PTR_ERR(ud->mmrs[V2_MMR_GCFG]);
+
+	ud->bchan_cnt = ud->match_data->bchan_cnt;
+	/* There are no tchan and rchan in BCDMA_V2.
+	 * Duplicate chan as tchan and rchan to keep the common code
+	 * in k3-udma-common.c functional for BCDMA_V2.
+	 */
+	ud->chan_cnt = ud->match_data->chan_cnt;
+	ud->tchan_cnt = ud->match_data->chan_cnt;
+	ud->rchan_cnt = ud->match_data->chan_cnt;
+	ud->rflow_cnt = ud->chan_cnt;
+
+	for (i = 1; i < V2_MMR_LAST; i++) {
+		if (i == V2_MMR_BCHANRT && ud->bchan_cnt == 0)
+			continue;
+		if (i == V2_MMR_CHANRT && ud->chan_cnt == 0)
+			continue;
+
+		ud->mmrs[i] = devm_platform_ioremap_resource_byname(pdev, v2_mmr_names[i]);
+		if (IS_ERR(ud->mmrs[i]))
+			return PTR_ERR(ud->mmrs[i]);
+	}
+
+	return 0;
+}
+
+static int udma_v2_probe(struct platform_device *pdev)
+{
+	const struct soc_device_attribute *soc;
+	struct device *dev = &pdev->dev;
+	const struct of_device_id *match;
+	struct udma_dev *ud;
+	int ch_count, i, ret;
+
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(48));
+	if (ret)
+		dev_err(dev, "failed to set dma mask stuff\n");
+
+	ud = devm_kzalloc(dev, sizeof(*ud), GFP_KERNEL);
+	if (!ud)
+		return -ENOMEM;
+
+	match = of_match_node(udma_of_match, dev->of_node);
+	if (!match) {
+		dev_err(dev, "No compatible match found\n");
+		return -ENODEV;
+	}
+	ud->match_data = match->data;
+
+	ud->soc_data = ud->match_data->soc_data;
+	if (!ud->soc_data) {
+		soc = soc_device_match(k3_soc_devices);
+		if (!soc) {
+			dev_err(dev, "No compatible SoC found\n");
+			return -ENODEV;
+		}
+		ud->soc_data = soc->data;
+	}
+	// Setup function pointers
+	ud->start = udma_v2_start;
+	ud->stop = udma_v2_stop;
+	ud->reset_chan = udma_v2_reset_chan;
+	ud->decrement_byte_counters = udma_v2_decrement_byte_counters;
+	ud->bcdma_setup_sci_resources = NULL;
+
+	ret = udma_v2_get_mmrs(pdev, ud);
+	if (ret)
+		return ret;
+
+	struct k3_ringacc_init_data ring_init_data = {0};
+
+	ring_init_data.num_rings = ud->bchan_cnt + ud->chan_cnt;
+
+	ud->ringacc = k3_ringacc_dmarings_init(pdev, &ring_init_data);
+
+	if (IS_ERR(ud->ringacc))
+		return PTR_ERR(ud->ringacc);
+
+	dma_cap_set(DMA_SLAVE, ud->ddev.cap_mask);
+
+	dma_cap_set(DMA_CYCLIC, ud->ddev.cap_mask);
+	ud->ddev.device_prep_dma_cyclic = udma_prep_dma_cyclic;
+
+	ud->ddev.device_config = udma_slave_config;
+	ud->ddev.device_prep_slave_sg = udma_prep_slave_sg;
+	ud->ddev.device_issue_pending = udma_issue_pending;
+	ud->ddev.device_tx_status = udma_v2_tx_status;
+	ud->ddev.device_pause = udma_v2_pause;
+	ud->ddev.device_resume = udma_v2_resume;
+	ud->ddev.device_terminate_all = udma_terminate_all;
+	ud->ddev.device_synchronize = udma_synchronize;
+#ifdef CONFIG_DEBUG_FS
+	ud->ddev.dbg_summary_show = udma_dbg_summary_show;
+#endif
+
+	ud->ddev.device_alloc_chan_resources =
+		bcdma_v2_alloc_chan_resources;
+
+	ud->ddev.device_free_chan_resources = udma_free_chan_resources;
+
+	ud->ddev.src_addr_widths = TI_UDMAC_BUSWIDTHS;
+	ud->ddev.dst_addr_widths = TI_UDMAC_BUSWIDTHS;
+	ud->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
+	ud->ddev.residue_granularity = DMA_RESIDUE_GRANULARITY_BURST;
+	ud->ddev.desc_metadata_modes = DESC_METADATA_CLIENT |
+				       DESC_METADATA_ENGINE;
+	if (ud->match_data->enable_memcpy_support &&
+	    !(ud->match_data->type == DMA_TYPE_BCDMA && ud->bchan_cnt == 0)) {
+		dma_cap_set(DMA_MEMCPY, ud->ddev.cap_mask);
+		ud->ddev.device_prep_dma_memcpy = udma_prep_dma_memcpy;
+		ud->ddev.directions |= BIT(DMA_MEM_TO_MEM);
+	}
+
+	ud->ddev.dev = dev;
+	ud->dev = dev;
+	ud->psil_base = ud->match_data->psil_base;
+
+	INIT_LIST_HEAD(&ud->ddev.channels);
+	INIT_LIST_HEAD(&ud->desc_to_purge);
+
+	ch_count = k3_udma_setup_resources(ud);
+	if (ch_count <= 0)
+		return ch_count;
+
+	spin_lock_init(&ud->lock);
+	INIT_WORK(&ud->purge_work, udma_purge_desc_work);
+
+	ud->desc_align = 64;
+	if (ud->desc_align < dma_get_cache_alignment())
+		ud->desc_align = dma_get_cache_alignment();
+
+	ret = udma_setup_rx_flush(ud);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ud->bchan_cnt; i++) {
+		struct udma_bchan *bchan = &ud->bchans[i];
+
+		bchan->id = i;
+		bchan->reg_rt = ud->mmrs[V2_MMR_BCHANRT] + i * 0x1000;
+	}
+
+	for (i = 0; i < ud->tchan_cnt; i++) {
+		struct udma_tchan *tchan = &ud->tchans[i];
+
+		tchan->id = i;
+		tchan->reg_rt = ud->mmrs[V2_MMR_CHANRT] + i * 0x1000;
+	}
+
+	for (i = 0; i < ud->rchan_cnt; i++) {
+		struct udma_rchan *rchan = &ud->rchans[i];
+
+		rchan->id = i;
+		rchan->reg_rt = ud->mmrs[V2_MMR_CHANRT] + i * 0x1000;
+	}
+
+	for (i = 0; i < ud->rflow_cnt; i++) {
+		struct udma_rflow *rflow = &ud->rflows[i];
+
+		rflow->id = i;
+		rflow->reg_rt = ud->rflow_rt + i * 0x2000;
+	}
+
+	for (i = 0; i < ch_count; i++) {
+		struct udma_chan *uc = &ud->channels[i];
+
+		uc->ud = ud;
+		uc->vc.desc_free = udma_desc_free;
+		uc->id = i;
+		uc->bchan = NULL;
+		uc->tchan = NULL;
+		uc->rchan = NULL;
+		uc->config.remote_thread_id = -1;
+		uc->config.mapped_channel_id = -1;
+		uc->config.default_flow_id = -1;
+		uc->config.dir = DMA_MEM_TO_MEM;
+		uc->name = devm_kasprintf(dev, GFP_KERNEL, "%s chan%d",
+					  dev_name(dev), i);
+
+		vchan_init(&uc->vc, &ud->ddev);
+		/* Use custom vchan completion handling */
+		tasklet_setup(&uc->vc.task, udma_vchan_complete);
+		init_completion(&uc->teardown_completed);
+		INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
+	}
+
+	/* Configure the copy_align to the maximum burst size the device supports */
+	ud->ddev.copy_align = udma_get_copy_align(ud);
+
+	ret = dma_async_device_register(&ud->ddev);
+	if (ret) {
+		dev_err(dev, "failed to register slave DMA engine: %d\n", ret);
+		return ret;
+	}
+
+	platform_set_drvdata(pdev, ud);
+
+	ret = of_dma_controller_register(dev->of_node, udma_v2_of_xlate, ud);
+	if (ret) {
+		dev_err(dev, "failed to register of_dma controller\n");
+		dma_async_device_unregister(&ud->ddev);
+	}
+
+	return ret;
+}
+
+static int __maybe_unused udma_v2_pm_suspend(struct device *dev)
+{
+	struct udma_dev *ud = dev_get_drvdata(dev);
+	struct dma_device *dma_dev = &ud->ddev;
+	struct dma_chan *chan;
+	struct udma_chan *uc;
+
+	list_for_each_entry(chan, &dma_dev->channels, device_node) {
+		if (chan->client_count) {
+			uc = to_udma_chan(chan);
+			/* backup the channel configuration */
+			memcpy(&uc->backup_config, &uc->config,
+			       sizeof(struct udma_chan_config));
+			dev_dbg(dev, "Suspending channel %s\n",
+				dma_chan_name(chan));
+			ud->ddev.device_free_chan_resources(chan);
+		}
+	}
+
+	return 0;
+}
+
+static int __maybe_unused udma_v2_pm_resume(struct device *dev)
+{
+	struct udma_dev *ud = dev_get_drvdata(dev);
+	struct dma_device *dma_dev = &ud->ddev;
+	struct dma_chan *chan;
+	struct udma_chan *uc;
+	int ret;
+
+	list_for_each_entry(chan, &dma_dev->channels, device_node) {
+		if (chan->client_count) {
+			uc = to_udma_chan(chan);
+			/* restore the channel configuration */
+			memcpy(&uc->config, &uc->backup_config,
+			       sizeof(struct udma_chan_config));
+			dev_dbg(dev, "Resuming channel %s\n",
+				dma_chan_name(chan));
+			ret = ud->ddev.device_alloc_chan_resources(chan);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops udma_pm_ops = {
+	SET_LATE_SYSTEM_SLEEP_PM_OPS(udma_v2_pm_suspend, udma_v2_pm_resume)
+};
+
+static struct platform_driver bcdma_v2_driver = {
+	.driver = {
+		.name	= "ti-udma-v2",
+		.of_match_table = udma_of_match,
+		.suppress_bind_attrs = true,
+		.pm = &udma_pm_ops,
+	},
+	.probe		= udma_v2_probe,
+};
+
+module_platform_driver(bcdma_v2_driver);
+MODULE_DESCRIPTION("Texas Instruments K3 UDMA v2 support");
+MODULE_LICENSE("GPL");
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index ddedd51ab26d9..6bf35dfec5e4e 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -1810,6 +1810,7 @@ static struct dma_chan *udma_of_xlate(struct of_phandle_args *dma_spec,
 
 static struct udma_match_data am654_main_data = {
 	.type = DMA_TYPE_UDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x1000,
 	.enable_memcpy_support = true,
 	.statictr_z_mask = GENMASK(11, 0),
@@ -1822,6 +1823,7 @@ static struct udma_match_data am654_main_data = {
 
 static struct udma_match_data am654_mcu_data = {
 	.type = DMA_TYPE_UDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x6000,
 	.enable_memcpy_support = false,
 	.statictr_z_mask = GENMASK(11, 0),
@@ -1834,6 +1836,7 @@ static struct udma_match_data am654_mcu_data = {
 
 static struct udma_match_data j721e_main_data = {
 	.type = DMA_TYPE_UDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x1000,
 	.enable_memcpy_support = true,
 	.flags = UDMA_FLAGS_J7_CLASS,
@@ -1847,6 +1850,7 @@ static struct udma_match_data j721e_main_data = {
 
 static struct udma_match_data j721e_mcu_data = {
 	.type = DMA_TYPE_UDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x6000,
 	.enable_memcpy_support = false, /* MEM_TO_MEM is slow via MCU UDMA */
 	.flags = UDMA_FLAGS_J7_CLASS,
@@ -1876,6 +1880,7 @@ static struct udma_soc_data j721s2_bcdma_csi_soc_data = {
 
 static struct udma_match_data am62a_bcdma_csirx_data = {
 	.type = DMA_TYPE_BCDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x3100,
 	.enable_memcpy_support = false,
 	.burst_size = {
@@ -1888,6 +1893,7 @@ static struct udma_match_data am62a_bcdma_csirx_data = {
 
 static struct udma_match_data am64_bcdma_data = {
 	.type = DMA_TYPE_BCDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x2000, /* for tchan and rchan, not applicable to bchan */
 	.enable_memcpy_support = true, /* Supported via bchan */
 	.flags = UDMA_FLAGS_J7_CLASS,
@@ -1901,6 +1907,7 @@ static struct udma_match_data am64_bcdma_data = {
 
 static struct udma_match_data am64_pktdma_data = {
 	.type = DMA_TYPE_PKTDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x1000,
 	.enable_memcpy_support = false, /* PKTDMA does not support MEM_TO_MEM */
 	.flags = UDMA_FLAGS_J7_CLASS,
@@ -1914,6 +1921,7 @@ static struct udma_match_data am64_pktdma_data = {
 
 static struct udma_match_data j721s2_bcdma_csi_data = {
 	.type = DMA_TYPE_BCDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x2000,
 	.enable_memcpy_support = false,
 	.burst_size = {
@@ -1926,6 +1934,7 @@ static struct udma_match_data j721s2_bcdma_csi_data = {
 
 static struct udma_match_data j722s_bcdma_csi_data = {
 	.type = DMA_TYPE_BCDMA,
+	.version = K3_UDMA_V1,
 	.psil_base = 0x3100,
 	.enable_memcpy_support = false,
 	.burst_size = {
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index d64b670d42490..b2e5455b1087e 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -32,6 +32,12 @@
 #define UDMA_CHAN_RT_SWTRIG_REG		0x8
 #define UDMA_CHAN_RT_STDATA_REG		0x80
 
+#define UDMA_CHAN_RT_STATIC_TR_XY_REG	0x800
+#define UDMA_CHAN_RT_STATIC_TR_Z_REG	0x804
+#define UDMA_CHAN_RT_PERIPH_BCNT_REG	0x810
+#define UDMA_CHAN_RT_FIFO_SEL_REG	0x824
+#define UDMA_CHAN_RT_PDMA_STATE_REG		0x80c
+
 #define UDMA_CHAN_RT_PEER_REG(i)	(0x200 + ((i) * 0x4))
 #define UDMA_CHAN_RT_PEER_STATIC_TR_XY_REG	\
 	UDMA_CHAN_RT_PEER_REG(0)	/* PSI-L: 0x400 */
@@ -71,8 +77,16 @@
 #define UDMA_CHAN_RT_CTL_TDOWN		BIT(30)
 #define UDMA_CHAN_RT_CTL_PAUSE		BIT(29)
 #define UDMA_CHAN_RT_CTL_FTDOWN		BIT(28)
+#define UDMA_CHAN_RT_CTL_AUTOPAIR      BIT(23)
+#define UDMA_CHAN_RT_CTL_PAIR_TIMEOUT  BIT(17)
+#define UDMA_CHAN_RT_CTL_PAIR_COMPLETE BIT(16)
 #define UDMA_CHAN_RT_CTL_ERROR		BIT(0)
 
+/* UDMA_CHAN_RT_PDMA_STATE_REG */
+#define UDMA_CHAN_RT_PDMA_STATE_IN_EVT		BIT(31)
+#define UDMA_CHAN_RT_PDMA_STATE_TDOWN		BIT(30)
+#define UDMA_CHAN_RT_PDMA_STATE_PAUSE		BIT(29)
+
 /* UDMA_CHAN_RT_PEER_RT_EN_REG */
 #define UDMA_PEER_RT_EN_ENABLE		BIT(31)
 #define UDMA_PEER_RT_EN_TEARDOWN	BIT(30)
@@ -103,6 +117,9 @@
  */
 #define PDMA_STATIC_TR_Z(x, mask)	((x) & (mask))
 
+/* UDMA_CHAN_RT_PEER_REG(8) */
+#define UDMA_CHAN_RT_PEER_REG8_FLUSH	0x09000000
+
 /* Address Space Select */
 #define K3_ADDRESS_ASEL_SHIFT		48
 
@@ -208,6 +225,11 @@ enum k3_dma_type {
 	DMA_TYPE_PKTDMA,
 };
 
+enum k3_dma_version {
+	K3_UDMA_V1 = 0,
+	K3_UDMA_V2,
+};
+
 enum udma_mmr {
 	MMR_GCFG = 0,
 	MMR_BCHANRT,
@@ -216,6 +238,13 @@ enum udma_mmr {
 	MMR_LAST,
 };
 
+enum udma_v2_mmr {
+	V2_MMR_GCFG = 0,
+	V2_MMR_BCHANRT,
+	V2_MMR_CHANRT,
+	V2_MMR_LAST,
+};
+
 struct udma_filter_param {
 	int remote_thread_id;
 	u32 atype;
@@ -223,6 +252,13 @@ struct udma_filter_param {
 	u32 tr_trigger_type;
 };
 
+struct udma_v2_filter_param {
+	u32 tr_trigger_type;
+	u32 trigger_param;
+	u32 channel_id;
+	u32 asel;
+};
+
 struct udma_tchan {
 	void __iomem *reg_rt;
 
@@ -234,17 +270,13 @@ struct udma_tchan {
 };
 
 #define udma_bchan udma_tchan
+#define udma_rchan udma_tchan
 
 struct udma_rflow {
 	int id;
 	struct k3_ring *fd_ring; /* Free Descriptor ring */
 	struct k3_ring *r_ring; /* Receive ring */
-};
-
-struct udma_rchan {
 	void __iomem *reg_rt;
-
-	int id;
 };
 
 struct udma_oes_offsets {
@@ -266,12 +298,19 @@ struct udma_oes_offsets {
 
 struct udma_match_data {
 	enum k3_dma_type type;
+	enum k3_dma_version version;
 	u32 psil_base;
 	bool enable_memcpy_support;
 	u32 flags;
 	u32 statictr_z_mask;
 	u8 burst_size[3];
 	struct udma_soc_data *soc_data;
+	u32 bchan_cnt;
+	u32 chan_cnt;
+	u32 tchan_cnt;
+	u32 rchan_cnt;
+	u32 tflow_cnt;
+	u32 rflow_cnt;
 };
 
 struct udma_soc_data {
@@ -306,6 +345,7 @@ struct udma_dev {
 	struct dma_device ddev;
 	struct device *dev;
 	void __iomem *mmrs[MMR_LAST];
+	void __iomem *rflow_rt;
 	const struct udma_match_data *match_data;
 	const struct udma_soc_data *soc_data;
 
@@ -326,12 +366,14 @@ struct udma_dev {
 	struct udma_rx_flush rx_flush;
 
 	int bchan_cnt;
+	int chan_cnt;
 	int tchan_cnt;
 	int echan_cnt;
 	int rchan_cnt;
 	int rflow_cnt;
 	int tflow_cnt;
 	unsigned long *bchan_map;
+	unsigned long *chan_map;
 	unsigned long *tchan_map;
 	unsigned long *rchan_map;
 	unsigned long *rflow_gp_map;
@@ -340,6 +382,7 @@ struct udma_dev {
 	unsigned long *tflow_map;
 
 	struct udma_bchan *bchans;
+	struct udma_tchan *chans;
 	struct udma_tchan *tchans;
 	struct udma_rchan *rchans;
 	struct udma_rflow *rflows;
@@ -411,6 +454,7 @@ struct udma_chan_config {
 	bool enable_acc32;
 	bool enable_burst;
 	enum udma_tp_level channel_tpl; /* Channel Throughput Level */
+	u8 fifo_id; /* XYMF FIFO index */
 
 	u32 tr_trigger_type;
 	unsigned long tx_flags;
@@ -434,6 +478,7 @@ struct udma_chan {
 	char *name;
 
 	struct udma_bchan *bchan;
+	struct udma_tchan *chan;
 	struct udma_tchan *tchan;
 	struct udma_rchan *rchan;
 	struct udma_rflow *rflow;
@@ -503,51 +548,33 @@ static inline void udma_update_bits(void __iomem *base, int reg,
 		writel(tmp, base + reg);
 }
 
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
+#define _UDMA_REG_ACCESS(channel)					\
+static inline u32 udma_##channel##rt_read(struct udma_chan *uc, int reg) \
+{ \
+	if (!uc->channel) \
+		return 0; \
+	return udma_read(uc->channel->reg_rt, reg); \
+} \
+\
+static inline void udma_##channel##rt_write(struct udma_chan *uc, int reg, u32 val) \
+{ \
+	if (!uc->channel) \
+		return; \
+	udma_write(uc->channel->reg_rt, reg, val); \
+} \
+\
+static inline void udma_##channel##rt_update_bits(struct udma_chan *uc, int reg, \
+						u32 mask, u32 val) \
+{ \
+	if (!uc->channel) \
+		return; \
+	udma_update_bits(uc->channel->reg_rt, reg, mask, val); \
 }
 
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
+_UDMA_REG_ACCESS(chan);
+_UDMA_REG_ACCESS(bchan);
+_UDMA_REG_ACCESS(tchan);
+_UDMA_REG_ACCESS(rchan);
 
 static inline dma_addr_t udma_curr_cppi5_desc_paddr(struct udma_desc *d,
 						    int idx)
diff --git a/include/linux/soc/ti/k3-ringacc.h b/include/linux/soc/ti/k3-ringacc.h
index 9f2d141c988bd..1ac01b97dd923 100644
--- a/include/linux/soc/ti/k3-ringacc.h
+++ b/include/linux/soc/ti/k3-ringacc.h
@@ -10,6 +10,9 @@
 
 #include <linux/types.h>
 
+#define K3_RINGACC_RT_INT_STATUS_COMPLETE	BIT(0)
+#define K3_RINGACC_RT_INT_STATUS_TR			BIT(2)
+
 struct device_node;
 
 /**
-- 
2.54.0

