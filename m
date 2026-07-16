Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020090.outbound.protection.outlook.com [52.101.229.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0487942B753;
	Thu, 16 Jul 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784215528; cv=fail; b=JAEV9wCkbh3t/bwPpmgjbExN4YudwpbLnaxxQ/w/OiChKfoV2xexoDGrBbxYVJPOkH0ciQc+U1pHwAC042Q0XkrQRwokTVACB3Wgy7MjBQtsjUJzIH7UPRYtH2yXUS+SvRTQYDhjoAoeTc8AN075x+Vb5puW+cskRYXZT1PRGk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784215528; c=relaxed/simple;
	bh=PGhR/YHKHMbNQrNLSWOGp1l4grNtlbC1WJib2jgkAvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h6Dwb6eJSWHZyCrGbSyE436QrmwtZMv7Z06fVSDbthnPztqARo8wOMl24D370CQuxD+KMDAJxnRHKDgIEOXAtCusBGMcgFSOM+XL5uLSyzcTkWH3cnT8kvPmitpFwo80TT5yk/B5GqPEH3XIRLCGtR1Kj6s6Ul8c0qfyIfHikEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=jivG8xsm; arc=fail smtp.client-ip=52.101.229.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="jivG8xsm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpf5Wu7JLeKYboF12QPKB2JVfBSrDC/wl4Omlo8kxw6GxYpvRPaPIVy4dCfuoRT6DXiySjZOKkZYIVtUR208IBDxcPCHn+Q/lsmYH7cRx8Cif5kHmM90+ZqVJS0d/dKb+XoVP85Pb2f0R3qg7eW9vFihyydjdjVNwxfH/p5mL9bEZ+18eXNHIaMbiCYxhfe8YT/q/DBkaREryvAFM5gK3wehN21xjxlx3EilCusfGwlbhZ+XDp1SG5mDYkrNFWnZk+ip3xmGOgBBunRu+nDRMnpU7V7pjmaIjJk6L5+mcAf82dtpM1V7kl8N2WCwZFDLLhBaXwgbca5msNffpFcJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPb769FfgnRaA4ix4ourhagpyCqog8+3a/QhJ7AbX9k=;
 b=zQGlp7pln41GUdHvazs4qSfMk0uw46ChS9L0T0dYVN3s96JVlsCB1+D7YAgRmN37amsYsrCtqge5Kx8eY7aHHH7zF9kv/+654YPHmHoIClsLLPHvaVVFGYAeTiaJMXKX8tQW8d9yvBvhlGjJHMR46W8uDNpkzPyfb02q/BjU6SwHOLqjpavnMOG5GIcdVVkWEjK3De3rSbHF4/gouCUIWy1B5b61S9NW3UnWFlnGWBDf+kH2l3DCodRH8SNJch57XXT1Y0OPZrL80CRDCdGcxdnO7WA4oE7hijnDiYB0TdEFKgtpOHmgylDaxPPODhCIcup1NrBNhFdn2HUpzapl8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPb769FfgnRaA4ix4ourhagpyCqog8+3a/QhJ7AbX9k=;
 b=jivG8xsmxgY7DEazEtS5DXfCfliWJn5aQMOMouVvicc5bixvMvpAU6vpj/CBN73J96W5o/erOp4UFTmx9hrGfaShgRbvglltP00UNJiBmM69UO/C0fTbathK072VHVG2WAzslaJ62oI8HEgTCsm1/a4Rr1x9wlvvAA0xdd08D18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYCP286MB3635.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3a8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 15:25:20 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 15:25:20 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Serge Semin <fancer.lancer@gmail.com>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/9] dmaengine: dw-edma-pcie: Drop redundant pci_free_irq_vectors()
Date: Fri, 17 Jul 2026 00:25:01 +0900
Message-ID: <20260716152503.1747922-8-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260716152503.1747922-1-den@valinux.co.jp>
References: <20260716152503.1747922-1-den@valinux.co.jp>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:3bb::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYCP286MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e37db29-1059-42cb-aabe-08dee34e7284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|376014|366016|1800799024|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DxkDnv6KQoaJrWp5uQfXWY4Wbn3Z+9g27Q72FktUueWOfNVRN83AfJ86z16kNkMNdiUKYCNjlghCn/0Gfx2qlcRzMPMLrDQBDAYoGohfTukSKtFPI0i48HUZ08LnLp4DAP8DSqbbpmeXR5CXaCauIZOIkIkMSt2XX5bygOjlBMU6RzOd7RGHtqFPJOU1t5+t4eymqpu1vBYhR7zWUy3ABUdwljplLlCpsq+NhrJa6UjnkQbODKvSrd2p2bpkS/QDUouCDz2aaXMiEkpIEsSahdSYsxmrDcBcOs5eseG+BMo+OjcFqj7JYpgbgJ0GJFskkRSDnVsVlYbGVXNcPqMR5F63DyHrihiBO6oGqAmoouyDXwj+L60LHGDGvv298RYAh1HpJKzzb+Q8FbwuKwFNhZxovfEOrrVcSOs/T4rUlHrcWkJbSs9tUo73g+D/WPrPsRSgAkb7Q/OcodKIe6+tElHq76K+jsccH1v83G7M3Qv1sHDbUPUKT/eKlLOD6hY75u/e3Nvglr+giimPHGswPZC9VwBu9E4LIiH9NXbv9fSlWt262cb2DzARMpHM4VjJ36Dh+T/AXmZKHdQOC8+6sFH05ODEYtSPCbvCfFikRQfQ0mruGhsxhHkK9G29PI5QttcLvwXrVvPBE0Cchs4AG0lwYNXvhA3ngJE4hbgSYnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(376014)(366016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3gJdp1Rgv99mt/0wmqowMoLDs+vfe3cT+Cl8/GXtOOLiZ+/1iBX1lmlJ1TqT?=
 =?us-ascii?Q?wICHfBR7hrYdAnduuZzVj5lzjJQvp/w2NTMlx7WfMsNMqwxct6szJvx7U2u8?=
 =?us-ascii?Q?Ou6Tq3p/zDvZi3OLWFbpvztnAMY82nTyqDVJo9HQHu3qJmSclPqqj7HeFazX?=
 =?us-ascii?Q?XS12O3rJWrSKIWq8GyAndzEsDSWTHI4bquLXs8ZnOEmtaymZvERqDWCMpkPv?=
 =?us-ascii?Q?2y1fWAX9KxT3K/QpfDz3+mtoBhHZkPvFHsl8xw2BjBty8z219S89fbMRZbhd?=
 =?us-ascii?Q?VAaX7hAcBtTptTmIXT7AIGUt9PClR9AhIVDGp4lXiFLmPsqOQ1tzztUQE7Ga?=
 =?us-ascii?Q?gEZuy9Qn24XFcAp3Fbuxbe31w3bKMAR08LTjT7iewkPhFxMwoqJEcArMJrpk?=
 =?us-ascii?Q?nx8RG+/MSYHTPjDvsuNMbLSYyeB9wskTW1UOSh83Uqe8r8wH/FikFeogcHcD?=
 =?us-ascii?Q?KfhE6aPr0FdSx+l7bchSfsyilChjUNn/PqPugQCAEkgDiO5v+tT/EMIvdxxr?=
 =?us-ascii?Q?tuw3dwkTvcOsjZrQxk51eguYkiZGiW5x13WX6VrVSyebdqcRkhAj1+VIb9Bm?=
 =?us-ascii?Q?Jmdjs8eYJFM7EKWpFpfwZfiJSeuMAzxcW0hTX4s70NrgPWFXYeeY8rYN7qm5?=
 =?us-ascii?Q?MvMczFjRXKrgc1x6IhzUfUFSnehC7IwP0Drrq9Kyloah08GmUfh3MCmtxs8e?=
 =?us-ascii?Q?C051SwVDkJy587tQeQYvwE8ugNOYhI9PzE62gQnhVu712pbxmtkkD24sW1R+?=
 =?us-ascii?Q?oNlrLN613eXsBH/d3fN87jdy10TBnWl0ugrAD3822Fzn1LoaL85NL/7hGTk3?=
 =?us-ascii?Q?1thZ7H5ZKo1zqgPByKtUuulhGIvM4r4PAtp26MLdBJp4Ialz3Y7RDmPD99wn?=
 =?us-ascii?Q?ybsGYSdgQTQOvhU0Y4gXqopY48g2iXGT2zjhlxRoW6vUHTnx24HFcgX/TA7R?=
 =?us-ascii?Q?C94x47KlLxYuIWZzywxmSwgOyRmUqdLjqwqMdnmiGjjeNiNCHHntNiVRyX6E?=
 =?us-ascii?Q?uELQLtBqftni1Mr1QsYsPOSLoxcxMETZUg1A8NPknMp16R3g6Myq6Wi8Co6z?=
 =?us-ascii?Q?Fuz6K0wijeBpfHCEmmYPp2sdEixJSgutmJunNzhQRJfSOuyE4c6+Uz+PdLA2?=
 =?us-ascii?Q?F3ePPFOvw8aog/wBmwp86PBn7kAvJpxP9MC2ydhscyqyM43WrTO9T0KIR43J?=
 =?us-ascii?Q?ImY7rvywfg/CF30U3zKmGfb36bSblazZiE6mSHnmom/zALxmnZ3/8IgaWoJR?=
 =?us-ascii?Q?QmU+mK/RsaRd6PsNtEZPRGWbFQgEFi39cfTpGglPjPQ/yqCuFQcdXIdJiJI1?=
 =?us-ascii?Q?pvb9d8egFr3mt+XYoinBL/3VdE3fWGppwCk8owUSMYPMVAfiMgOuDCH9zC1F?=
 =?us-ascii?Q?vZ61nQsyth+GLstD8xIAAe/VmZjJyaniHzLG0eHotSiPobyOg042717Ci+tZ?=
 =?us-ascii?Q?H+tX+5WP/etGOqLN3JP18NXHCm9bp+wfGO9CchFI8Ftj6k5ZA7lvNcoCfiQv?=
 =?us-ascii?Q?Fr/Hko1a1YDc4Ep2Oigy9vLE02RWCsi0oMWpSD30JbtBJqoWdQDKeqQMMCRH?=
 =?us-ascii?Q?npfKepR5Mww36nV6s+wG4Fh/M8iKIYuPgAlJPhrn4rj3I7cEYJxOg6CySmoC?=
 =?us-ascii?Q?KNllA8TuQc69Zuqmnad8ZXJSkSTu7vfZfG4spJPKjYfsWCcuz/cM0Ijz/SA2?=
 =?us-ascii?Q?inF5tNdVuyVZx5w/PNBaMGsey2fYB94+hXdqSU6UuwDs3vlvS97H8V9NVwJX?=
 =?us-ascii?Q?z8olTupClYot0VlbKa3mYFCrIONOAb1rZK+XiWoqJsF9L083cpWB?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e37db29-1059-42cb-aabe-08dee34e7284
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 15:25:20.1949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0n6yGI9zAyYHXD6y1CkRHK57RCWDNMbYl1PpMulM/V8xNb3yBKEqDLYG93ohvme+pvxbXqzGpzednU2gZzPBEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3635

dw_edma_pcie enables the PCI device with pcim_enable_device(), so IRQ
vectors allocated by pci_alloc_irq_vectors() are released by
pcim_msi_release() on device release. The driver should not call
pci_free_irq_vectors() manually.

Drop the redundant remove-time cleanup and rely on the managed PCI
device lifetime instead, as documented by commit 03e4905402ae ("PCI/MSI:
Clarify pci_free_irq_vectors() usage for managed devices").

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v4:
  - No changes.

 drivers/dma/dw-edma/dw-edma-pcie.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
index 791c46e8ae4c..5e81a433a957 100644
--- a/drivers/dma/dw-edma/dw-edma-pcie.c
+++ b/drivers/dma/dw-edma/dw-edma-pcie.c
@@ -555,9 +555,6 @@ static void dw_edma_pcie_remove(struct pci_dev *pdev)
 	err = dw_edma_remove(chip);
 	if (err)
 		pci_warn(pdev, "can't remove device properly: %d\n", err);
-
-	/* Freeing IRQs */
-	pci_free_irq_vectors(pdev);
 }
 
 static const struct pci_device_id dw_edma_pcie_id_table[] = {
-- 
2.51.0

