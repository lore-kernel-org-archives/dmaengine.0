Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179B64A68BC;
	Thu,  1 Oct 2026 08:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844135; cv=fail; b=LpZCmL96BufK0oKjP75uaJvzjhK1j0dMElBcNGg56x85nG4PIMG2q8GUKUXl24OA8UrB6AuLoLeD19o0ur/fcRCbP29anMP7DqV+yWZfgyAGzsfRFktT4yT6nwDRxW+79wcYieJfUSMH/rJ7xRh+RlbVt4eBIyJpTiHx3qND0Cw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844135; c=relaxed/simple;
	bh=LT9wv61lrH2EU7e/4ptTF0OVkkI+ig4g3+IPX+hT8sQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GQbYLkI1nsUbGf7AuLYmcdC/mevSoV1oY7c3rMwuJcOGlBSoL9JBgVG0aWlpaR6WNt8lfa+5TpJ4xh5U1/RN0HNwGy8NkKxfnRk8iAM10+rZDS1eCKCqoI9uzMevX5CERqHqEAa4wTu8CWcUgfkpKZtKZx5KLuojyeITxaXXz/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=N5QFnlhk; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=hiiPLaTE; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="N5QFnlhk";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="hiiPLaTE"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69187Swi1207686;
	Thu, 1 Oct 2026 03:42:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=iN/Zf2iUHS6ay
	3Tbp3/02dnFuQPc642olhnAv8baZoA=; b=N5QFnlhkXsIlGhzAQpmmyRH+xYS3m
	6R2DGhnvONhTDKLMKfQU8ti4WW4jrNMFBTFnjHOQ5SjC8wImz/tdxrBMIBY3H/Qt
	qqT2IHJlPZpEkGSK3yzOIwW2pVkMG8umcNt1/Ml73Q+ed48CqQUFarMABW7dww3C
	879/64bITm8moaXbkra4rZy1vqz4KEJX9qEudwAY0cJ9ccSVJboiwmwXca/X61T6
	BRTNFeawOWG87sBRmI5Eu22eCMrZFAbLuL3YbuM5pihEwX/14Qdb4Iql1/ZadEPz
	dHJm809V5AmBOd1dyCU/9HmPGQqWlPJIZYGVHLZvV88Fyjt/yvkcPwJDg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011068.outbound.protection.outlook.com [52.101.57.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h1kqyg5pf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:42:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1Tg66j79EGgBJp7s4Y6DNwN4Xhv4f/BJSBDGAqYMGJ2CZUQEGH7zSOaHOCam9QtIkpxUe5vYg/7VJtrpGvKeLs7cuNiCA4rDZZM4bRWxvmPOD4PqWLTd2U0vuekBgXszRaCM8G2yZ/emfzTkwfezGryVGBPO4gyOfGJQIkPW+GjJSlOh/RnpyunY3QppnQ8qDCPeBzZMlga3hQG3HRastHT3WbKJtM9Dygt+5aKVKei+vm2w9Q0hsXsCmIVMQe0BzubH4d+57yFE5ikMBZnll8MJVqGZq+ppz8N3xuR8YD3KADQ/+epcXuhhceTaMib2Q75q5fzyjVyte8Q7q2xRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iN/Zf2iUHS6ay3Tbp3/02dnFuQPc642olhnAv8baZoA=;
 b=adNJPJXCUOZXNfQw21v4Bq+E9HO/vObdP/yndchxqRtPPV0+yThojyIzKbHlt4F//VngsBSScko2gStKaShm0oiTfESs/3s3+GSvmO0LjFv2dKhdiOpayd6fyGY727MTpn/UuPKhC1nvCp4jrixdvy3fc95G8woYCrC3lPkE1ucBaAVRuDAq3SruCdERLiD48pStuLmcdv0GMQLntsOb+QXQ8XpcoEvyHOeva382gvzysAUAB90R7om5uU8N9dGLdW9K6Tv9o/9Iy8dPzWNmrJ6VR4n+rWEMXg9Xb8fNwhJ+XiKa434TmJcrF29D6kEqR60oaXaCfX454lrn0yBnVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN/Zf2iUHS6ay3Tbp3/02dnFuQPc642olhnAv8baZoA=;
 b=hiiPLaTEN0/YPR/vrim3nygqJNjEHL8K86KzgzJcIQmbTjiMKGDr6JsBXFQvF8n996t47OWXaIJGQI/LjyqxjVCi3xnPXWBuXTmTtyarUoQi0ALJvYo/we/50QVEXEU975boV2Ykh4kzz72CRkREyOtIE8Z02V2cG+SWcBOpvrk=
Received: from CH0PR03CA0326.namprd03.prod.outlook.com (2603:10b6:610:118::9)
 by CY8PR10MB6873.namprd10.prod.outlook.com (2603:10b6:930:84::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 08:41:55 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::2) by CH0PR03CA0326.outlook.office365.com
 (2603:10b6:610:118::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 08:41:55 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:41:54 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:14 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:41:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:41:14 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6918f9rp630551;
	Thu, 1 Oct 2026 03:41:10 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v11 00/19] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Thu, 1 Oct 2026 14:10:16 +0530
Message-ID: <20261001084105.1692228-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.55.0
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|CY8PR10MB6873:EE_
X-MS-Office365-Filtering-Correlation-Id: d900eed5-b054-4083-067a-08df1f97d871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|7416014|10067099003|56012099006|921020|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	vcTBPIbuQTi09W0sHpdyt9a8lU/605wsBXkC/8EHP4Yk5QrczezyvHhQ65Vh+Bmw0m+mVa8888Avmu307Fl7WGqyBpG/CD0M8twMyUzQ/H962KmEe8J01BeFXHxeVU/cIc5LtQYUEtNxF3vr5g43pqBB5UdbGLtt1iTw6YbBM1YY3kt1isxnggqA6EwIxLbrht4YHDxUbf+qXN0Q+b6fGaL3E35ipDlFXo1ZjcnUU7abx3f79yTrJ0cH+PscmonaxCgT39r4TWX9Ijk1f09jSGX7SZROW873uP3RaTEZnHGK6MZFiptmwHpHxZr2fOmqeV93aqfAbkq5bA22RuNQNJ4QlTuzEjzajiS/T3u1me+ydR0j7QCotghaf/sH9DEZ6HCrkElSHtNrQFiWZIeTCjx86cspuRvqWKWeIz/yIPZEL5XWaOl9wdK/q9xc3kk16tZ+bW0mM6wMUrzJ+c2zowWii3oJ9KCNIf6MoDLkEsrbVEInBmZPfNcUo6aflTYbYZc8lHda//dj4IKVqa0GrgYn6p0WPVLyktBcnCFHs1SaTltcxviGTbF/7S7ptVhw0ctJ9frNxh6wtbT7luQ903g3Q3yrCHZvaxULDHWBP9tr/oqZbYgnNlBBPVjD33vHFFlrsesNmZttXyPIJ7pzBblYKgkDWobJeaJeoLKe4OrpNnCcKvq0aGDxoy6gxUe8
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(7416014)(10067099003)(56012099006)(921020)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+90aQNDFUAWG/6GPBs0S0dNbd60gLVOc0ozky2dHK+54g54PbettXYbc5ykzLvowF2GHz9d+LcyKUqIbHjkAZ7GoX0/F8d8FN5NSNCTUflC+2UdSlzq7chqVPb2X+FrmxeA7y+rWYruPlJNQBAoxZ+VaJ92WSn8jV026gyMb8hPTs09mevWb2rExlK353op9DAKJxYeSugNvQjIDVCbmdMZ/VAzBOfRPvUpyoNO3nSevYzq1oDhBeFVTp6J1KpDeqhh7x9+DnCHLvsgvBgbQu85XCzY83YSvx1eO9T2G9B9ZN/EoGTda/p0aPrbsbKTTZPMoxY4L2tXDOUpLgH7ZvofebR/vJXNx+EHArDGFy4a1szGgjLnPUGwSBrtpZVF5VmoDO+u4GvleSqlES1XN3FOKTwCMts9vyTOSnD4zaolkNOzTd3xIMe/B5Z7FcHA7
X-Exchange-RoutingPolicyChecked:
	sU9idofxaadv/QpbsH4TzfzJkpcCecAGnlpGCLkxX3nopx7VmLI06yXdMFfQxhH5FLF6LhbbLbYYXzCGthMvwMSNS/0bgolqpCZnra4MwiloPv/ZhO/sILzDQt4imCQIzhmZsWumSd4aAngkhoyTvSOzdI21ErtopHvBXvbTVKUAAUHkuItpiNU1s3TRJCjezMM25D35cCy/dWUJ4MeC23cNr2q/vc0ySBJEJJSUBelRlGdk473uOB5uckaPrRMf3AQlqJPxh44AgnO36O8coEKzNd0ryfNNMVFrUJCi4+mvzcr9n+ZSjn9WprT4cjEYqxsWL0CTGmTUDOSOB8nGUQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:41:54.0722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d900eed5-b054-4083-067a-08df1f97d871
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6873
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX20GT5dgwzPkS
 9PlYtzpM9xtjy519W/H0UXvhborON6t+QTYcrhzyF42cfziNvbPGrq6RigkrcbmkzhcS/ZN/ErV
 Ln7wuLvE286C5eeUl9MeHcnIgzyEEF0=
X-Authority-Analysis: v=2.4 cv=a6alZkSF c=1 sm=1 tr=0 ts=6abe1cdc cx=c_pps
 a=lgH93Z6fMBj3OFKE3BLqTA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=c92rfblmAAAA:8
 a=7v5KQBRJq1FyZDMF_9YA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX/CAVom7IYcaD
 l4xJoSFL5T2Nu0nsDttEaewBPOTevVJJvh3P09uJel+x1+K/wrWPqpm+EX9nMreU3S33+7KtxoU
 pdJGFxU/CG7eSh35JrT30AHtb28SdPE6ZaAkjzE2w887e+K0n2SUqrjkIkBtAQf9ahhtcElLFO6
 Ksu+1uY/ds1Bdtb0iJVHAkEENc0nfwvcJtzIIopyUzcZNvwDfhF8uf+NeNJSqPQwb+SPaCBpe8v
 eB+prblkAy06CAdkNiEAvb87eQfkkX+o3ZMayNT76Zvl7er8sXYr+HFWcpTZyFH/41VUs6GGKV2
 JtNXbT3PxrDiJ3p7kHurRhyBTduRpcrtwOc3NqQ89h2b2bVLJWXv+hBvRNd+CvXAjjJCGrY5LBe
 aayqHPYXsRaDyAGCvUPtlQSQSOu5AlpLSluv1ilCdmAuv7JFtEk9xHI+KHwM4J0M/SF3jiFdrMS
 FjCCJ5Rkovbb3PeO8JQ==
X-Proofpoint-ORIG-GUID: 1aK7TmyAIe8IYkiXdSX8SkppSsgaRJph
X-Proofpoint-GUID: 1aK7TmyAIe8IYkiXdSX8SkppSsgaRJph
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010034

This series adds support for the BCDMA_V2 and PKTDMA_V2 which is
introduced in AM62L.

The key differences between the existing DMA and DMA V2 are:
- Absence of TISCI: Instead of configuring via TISCI calls, direct
  register writes are required.
- Autopair: There is no longer a need for PSIL pair and instead AUTOPAIR
  bit needs to set in the RT_CTL register.
- Static channel mapping: Each channel is mapped to a single peripheral.
- Direct IRQs: There is no INT-A and interrupt lines from DMA are
  directly connected to GIC.
- Remote side configuration handled by DMA. So no need to write to PEER
  registers to START / STOP / PAUSE / TEARDOWN.
- Unified Channel Space: Tx and Rx channels share a single register
  space. Each channel index is specifically fixed in hardware as either
  Tx or Rx in an interleaved manner.

Full tree with device tree patches can be reviewed at:
https://github.com/sskartheekadivi/linux/tree/dma-upstream-v11

Changes from v10 to v11:
- [5/19], [8/19]: Restore seq_puts() for plain strings in
  udma_dbg_summary_show_chan(), reverting an accidental change to
  seq_printf().
- [10/19]: Fail bcdma/pktdma_setup_resources() with -EINVAL instead of
  skipping SCI resource setup when the sci_resources hook is NULL on
  K3_UDMA_V1.
- [11/19]: Pin the owning module in of_xudma_dev_get() via
  try_module_get(); add xudma_dev_put(), called from
  k3_udma_glue_release_tx_chn()/release_rx_chn().
- [12/19]: Fix k3_ringacc_ring_free_sci() to actually wait for SIZE to
  clear before programming the new count, and bail on timeout; require
  TI_SCI_INTA_MSI_DOMAIN for a DT-probed ringacc with ti,sci.
- [15/19]: Take ep_map_mutex around the ep_config memcpy in
  psil_set_new_ep_config(); log by channel ID when the lookup is
  channel-ID based.
- [16/19]: Add TI_SCI_INTA_IRQCHIP dependency, allow COMPILE_TEST, set
  ddev.owner, add udma_v2_remove(); move udma_reset_rings() before IRQ
  request; free uc->desc on a start timeout instead of leaking it;
  simplify udma_v2_ring_irq_handler() to avoid double-completing a
  descriptor.
- [17/19]: Use uc->tchan->tflow_id / uc->rflow->id instead of
  mapped_channel_id for the per-flow ring IRQ lookup, matching the
  glue layer.
- [18/19]: Fix inverted epib/psdata_size checks in the no-TISCI RX
  config path of k3_udma_glue_cfg_rx_chn().
- Fix issues reported by Sashiko introduced by this series.
- Pick up Reviewed-by tags from v10 (14/19, 15/19, 16/19, 19/19).
link to v10:
https://lore.kernel.org/all/20260928025749.1055383-1-s-adivi@ti.com/

Changes from v9 to v10:
- [12/19]: Clear the ring size before the base address registers and
  disable the ring's interrupts (INT_ENABLE_CLR) on free, mirroring
  the enable done on config.
- [15/19]: Validate dma-cells count before indexing dma_spec.args[] in
  the pktdma/bcdma paths; fix thread ID used in the error log.
- [16/19]: Check devm_kasprintf() return value in probe; clear
  uc->chan in all three put functions to avoid a dangling alias;
  return IRQ_HANDLED instead of IRQ_NONE when a TR interrupt was
  actually serviced; fix -ENOENT return from an irqreturn_t function;
  drop a duplicate UDMA_CHAN_RT_CTL_REG write.
- [17/19]: Drop the unused pktdma_v2_driver forward declaration and
  its filter check; pass bool instead of the DMA_TYPE_PKTDMA enum to
  psil_get_ep_config_by_id().
- [18/19]: Apply tx_pause_on_err/tx_supr_tdpkt in the no-TISCI TX
  config path and rx_error_handling in the no-TISCI RX flow path;
  flush the peer before TDOWN in TX teardown, matching RX.
- Fix issues reported by Sashiko which are introduced by this series
  https://sashiko.dev/#/patchset/20260922064902.2719979-1-s-adivi@ti.com
  (12/19, 15/19, 16/19, 17/19, 18/19)
link to v9:
https://lore.kernel.org/all/20260922064902.2719979-1-s-adivi@ti.com/ 

Changes from v8 to v9:
- [01/19]: Add Fixes tag (Frank Li).
- [05/19]: Drop redundant "default n" on TI_K3_UDMA_COMMON (Vignesh).
- [12/19]: Poll for SIZE to clear instead of an unverified comment,
  rename ring2 to fwd_ring, take an explicit status mask in
  k3_ringacc_ring_clear_irq() (Vignesh).
- [13/19], [14/19]: Both carry an extra fix beyond what Krzysztof
  reviewed in v7 (minItems on interrupt-names had to come back). should
  have said so in v8's changelog, sorry about that. Krzysztof re-tagged
  13/19 in v8; 14/19 has no tag since it hasn't been re-reviewed.
- Fix issues reported by Sashiko which are introduced by this series
  https://sashiko.dev/#/patchset/20260810151423.1948224-1-s-adivi@ti.com
  (09/19, 12/19, 15/19, 16/19, 17/19, 18/19)
link to v8:
https://lore.kernel.org/all/20260810151423.1948224-1-s-adivi@ti.com/

Changes from v7 to v8:
- Fix issues reported by Sashiko which are introduced by this series
  https://sashiko.dev/#/patchset/20260724102115.2854-1-s-adivi@ti.com
- Remove minItems for interrupts entry in both BCDMA and PKTDMA
  dt-bindings
- Update interrupt-names pattern for pktdma from tflow-<n>/rflow-<n> to
  tx-<n>/rx-<n>.
link to v7:
https://lore.kernel.org/all/20260724102115.2854-1-s-adivi@ti.com/

Changes from v6 to v7:
- Rebase to next-20260721
- [03/19]: Add missing includes
- Fix incorrect register bits used when configuring rx flows.
  Add correct UDMA_CHAN_CFG_FILT_EINFO/PSWORDS and
  UDMA_FLOWRT_RFA_RX_EINFO/PSINFO_PRESENT bit definitions.
- Update AM62L BCDMA and PKTDMA dt bindings to remove address cells,
  redefine dma-cells semantics (mapped channel id for bcdma, hardware
  flow id for pktdma) and fully enumerate interrupts/interrupt-names
  with restricted naming patterns.
- Add fifo select register write support for XYMF channels in the BCDMA
  v2 driver. Update udma_v2_filter_param to use channel id instead of
  remote thread id and resolve it via psil_get_ep_config_by_id().
- Switch channel resource bitmap allocation to devm_bitmap_zalloc() and
  ring IRQ registration to request_irq()+IRQF_SHARED (channels can now
  share a PSI-L/IRQ line); fix the ring IRQ handler to return IRQ_NONE
  for spurious/foreign interrupts instead of unconditionally claiming
  them.
link to v6:
https://lore.kernel.org/all/20260428085202.1724548-1-s-adivi@ti.com/

Changes from v5 to v6:
- Switch from interrupt-map to interrupts and interrupt-names in the
  dt-bindings.
- Reverse the if DMA version checks to check for v1 and else v2.
- Add new patch [01/19] before refactoring to fix sporadic crash
  observed on AM62x.
link to v5:
https://lore.kernel.org/all/20260218095243.2832115-1-s-adivi@ti.com/

Changes from v4 to v5:
- Introduce a new version variable in udma_match_data to differentiate
  between K3 UDMA V1 and K3 UDMA V2. This simplifies the approach for
  adding any future possible variants avoiding complex if conditions.
- Fix both K3 BCDMA V2 and PKTDMA V2 dt bindings as per the comments
  from previous versions.
- Fix minor nitpicks like following the reverse christmas tree order for
  variable declarations.
- Remove the patch [v4 19/19] that switches to synchronous descriptor
  freeing. With this patch, dma_free_coherent gets called in irq
  context and hence a WARN().
link to v4:
https://lore.kernel.org/all/20260130110159.359501-1-s-adivi@ti.com/

Changes from v3 to v4:
- Rename the dt-binding files to add "ti," prefix.
- Update cell description in dt-bindings and add client examples.
- Update k3_ring_intr_regs reg names
- Rename soc specific data to bcdma_v2_data and pktdma_v2_data to
  bcdma_v2_am62l_data and pktdma_v2_am62l_data.
- Add a new patch [18/19] to fix a null pointer dereference issue when
  trying to reserve a channel id that is out of bounds in
  udma_reserve_##res macro. Also fix logging issues in this macro.
- Add a new patch [19/19] to switch to synchronous descriptor freeing to
  avoid running out of memory during stress tests.
- Fix checkpatch warnings.
link to v3:
https://lore.kernel.org/linux-arm-kernel/20250623053716.1493974-1-s-adivi@ti.com

Changes from v2 to v3:
- Fix checkpatch errors & spellings.
link to v2:
https://lore.kernel.org/linux-arm-kernel/20250612071521.3116831-1-s-adivi@ti.com

Changes from v1 to v2:
- Split refactoring of k3-udma driver into multiple commits
- Fix bcdma v2 and pktdma v2 dt-binding examples
- Fix compatibles in k3-udma-v2.c
- move udma_is_desc_really_done to k3-udma-common.c as the difference
  between k3-udma and k3-udma-v2 implementation is minor.
- remove udma_ prefix to function pointers in udma_dev
- reorder the commits to first refactor the existing code completely and
  then introduce k3-udma-v2 related commits.
- remove redundant includes in k3-udma-common.c
- remove ti_sci_ dependency for k3_ringacc in Kconfig
- refactor setup_resources functions to remove ti_sci_ code from common
  logic.
link to v1:
https://lore.kernel.org/linux-arm-kernel/20250428072032.946008-1-s-adivi@ti.com

Sai Sree Kartheek Adivi (18):
  dmaengine: ti: k3-udma: move macros to header file
  dmaengine: ti: k3-udma: move structs and enums to header file
  dmaengine: ti: k3-udma: move static inline helper functions to header
    file
  dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c
  dmaengine: ti: k3-udma: move ring management functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: Add variant-specific function pointers to
    udma_dev
  dmaengine: ti: k3-udma: move udma utility functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: move resource management functions to
    k3-udma-common.c
  dmaengine: ti: k3-udma: refactor resource setup functions
  dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to
    k3-udma-common.c
  drivers: soc: ti: k3-ringacc: handle absence of tisci
  dt-bindings: dma: ti: Add K3 BCDMA V2
  dt-bindings: dma: ti: Add K3 PKTDMA V2
  dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
  dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2
  dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
  dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
  dmaengine: ti: k3-udma: Validate resource ID and fix logging in
    reservation

Vignesh Raghavendra (1):
  dmaengine: ti: k3-udma: Fix sporadic crash on AM62x

 .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  |  211 ++
 .../bindings/dma/ti/ti,am62l-dmss-pktdma.yaml |  189 +
 drivers/dma/ti/Kconfig                        |   21 +-
 drivers/dma/ti/Makefile                       |    5 +-
 drivers/dma/ti/k3-psil-am62l.c                |  169 +
 drivers/dma/ti/k3-psil-priv.h                 |    5 +
 drivers/dma/ti/k3-psil.c                      |  106 +-
 drivers/dma/ti/k3-udma-common.c               | 2628 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |  218 +-
 drivers/dma/ti/k3-udma-private.c              |   53 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1577 +++++++++
 drivers/dma/ti/k3-udma.c                      | 3127 +----------------
 drivers/dma/ti/k3-udma.h                      |  571 +++
 drivers/soc/ti/k3-ringacc.c                   |  199 +-
 include/linux/dma/k3-psil.h                   |    3 +
 include/linux/soc/ti/k3-ringacc.h             |   21 +
 16 files changed, 6039 insertions(+), 3064 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.55.0

