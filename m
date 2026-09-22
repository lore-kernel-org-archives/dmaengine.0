Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043E4CB8C5;
	Tue, 22 Sep 2026 06:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059827; cv=fail; b=EfUKI6syJF3yVaV1nWU8tC1//XTzJenpUwMNJohSf0B8P7uk6ixJs6F6OGczYplVjOUlrR66OS3SKn0PGleEi2e6FhRwxTJkxeBsJUdcNv6r5/OiyM95EPPRZXpxRY8qsnpQOMvJLT+2zZ09+d/dlMlBzRlhLl47oMdNwoXTgCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059827; c=relaxed/simple;
	bh=WbtAdjOKMKr41MQqh12BQojn9SrnC/yYt0hnQknXJ5w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nBOJxCFarrm3NzY83SBr6g3XxWfK/gZuSmvU0V2JpsqhY8P+nTlUkbosamXxE334nLL1MVW/1eDKEZvN1LponKWzy4vUhJFpH3HGmXp48CTtJWuGe3CHNSO7rfPs5O/5rfAvZa8s+IPj/sAb0dFyk5xqUfMSIFE/+EpeS7DcE/s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Q1PgJSdL; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y2rYiR/7; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Q1PgJSdL";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y2rYiR/7"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M1pmMo1435618;
	Tue, 22 Sep 2026 01:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=cBvVBL8PiQGGJ
	Ip4cYo3Fqw1/LOaGqErrLlnVJ9YNsg=; b=Q1PgJSdLc8yfzV4ZVROXgLK8ZUCmf
	DMnj0c+xjbzwgSe4oZgIMV8DryADrBziamFW41j0+69kwHJifhIJsBxdz80XFqhI
	nu/IBv8EmLRGGyH9xMftab676m4Xi6NmU7Yzjo1m2Up38CvL1D/s69//wmzpqtnh
	wvQ2sd+rmOHa2DXV36Hkf+FhgPv3Q34QcST2+dHmJjB/FHGvcddiRdcMu8g6VSnO
	FbJpcf8R/QfSaBfCDTDCmRDHx4SmKVFGztg1w0jLyiLW9xTvNNIB+2wyv6RTAgXv
	Du9iLCiZ3whIGD/XHBx9nSJtPDRlT93j2mdb30UqqDGhqTad+rAywRoYg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013060.outbound.protection.outlook.com [40.93.201.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcsscf5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 01:50:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o2WD8q56VS6TT/H8TQn6nGlTMGGeM4io7IJyt4hZZElXrhS8ZZQAD2hBaZqp60dOEf+WdON+O3cNjkKnQr5AUlG5BngE2LzLDyA38DM/F4bh7t9vmNqDVrlXhuuEg9KlvtIuRbrqa8/6xXgPXfYWen5t7myAtexi+ZaQ8NhkB/2mLyclNsnmwzrIhmK9tuhwwfYcv9NCZCMSvD8AJLnKW0vMQvqpK5mTHoJHtZS1vULFR7gq7UZMBROwBITxdzHCJkvTkXvJ2ZY00ng3CBiHDIvypvo/xIfRWh8j0W7EJu5Q8G6BpMe00U4RhApZ53CwsOPhTK6/YRNm9XW+Gr4g0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBvVBL8PiQGGJIp4cYo3Fqw1/LOaGqErrLlnVJ9YNsg=;
 b=PMyCYThcFPNC2UjO0HWegbWljZbpcf2jch3Up/xROgkeW8STf0c0ag2KN98W0/uDr4o2d8lsSXYwBqw0Ik0KzqlSYGAIVov257Wns6X/XQL9MJeIB7Uh4YVM0cAsq4HJkPKR9w6waJWzuVWIiGpxNgSbVJPU/j53BzjueUKue0Vu7Zz/8JFf2CXG5tWidSQapCpwH/DyupkRaShkZMrySNX/5FhGHPpXWTCgOkAmyzWYtqZOfsBLuSpnXTdkOICaDeriq0CgXG6bgkS9yEJUbIXGFCVEdx0FchJzUIvTguaEGj7MIySCqNZwkGwrYVnZOaAfxf/8TNFeZKWmekXpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBvVBL8PiQGGJIp4cYo3Fqw1/LOaGqErrLlnVJ9YNsg=;
 b=Y2rYiR/77e8oGp/eyP2f0SW1RNReE3pGBTjvJpsSsBd5BI67naU4cn30Lgg0lKPG8yYihZvttTFz9UssypIugrP/eP4nCJ+59K/GKXhFmZqIUakoNizYGug31WL1ua8u2xjkRFtXS9sGtQe4p2OMpf6ngbVvrnZqC7+FYSLxZ10=
Received: from BYAPR21CA0003.namprd21.prod.outlook.com (2603:10b6:a03:114::13)
 by PH7PR10MB7767.namprd10.prod.outlook.com (2603:10b6:510:2fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 06:50:03 +0000
Received: from CO1PEPF00012E60.namprd05.prod.outlook.com
 (2603:10b6:a03:114:cafe::97) by BYAPR21CA0003.outlook.office365.com
 (2603:10b6:a03:114::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 06:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E60.mail.protection.outlook.com (10.167.249.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 06:50:00 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:23 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 01:49:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 01:49:23 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68M6nI3q3626771;
	Tue, 22 Sep 2026 01:49:19 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v9 00/19] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Tue, 22 Sep 2026 12:17:24 +0530
Message-ID: <20260922064902.2719979-1-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E60:EE_|PH7PR10MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b52faa-8b92-4182-e393-08df1875b95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|376014|36860700016|1800799024|23010399003|10067099003|56012099006|921020|6133799003|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	1BomCbvmuC1Ro+XjgM4Hv56w5pEUGY+5OR6dhVnth8aWvCmWOziT1dfqeyvKqY880e4feFnR8nhc+RebNc9aIJbwuuZJOlVdM9uih+VqU3q3SXIBtgS90r3islATdJb6QjVYZ4YzuUfVAUREFEzKztsdkOBFGNAr5Y9GgF4zJD5cttVlMHEEPgvWxl8v7bTq5mdJDWQ4UouSsaLG8I0TW4Mwc+dZ7BDlGpqpkv6rL4KnHjEJPruZQXRowpEycoFmvSB3LmPar2iv4wrCohUmZy+zmICN/tWBAHo3gs2e6GKFfF2LFRqRQzzwGxtUIS09i6Qia/iBbqS+KgKElZdofXeqnxhURqQJpSE6thhLvCIImJeThjl1UCAbnsHoKhyjv8peSTlwuvpn6xuPS92dUsF9SKXT1ecGgRy/rNAa8jezyl4kjzP52qnTrLInxNz7YKIoLSxS+ZHI12u9C4bgfN1Txrb4tB4Lzt0dP+F6Q05SPbrsKwGVR54VFh8cDZHYViXaWFyNBnMkCG15OqGXc+UvGJeCTP339BkZmkwBNWUEyZF3Lm0/eoXG+X8L7Z2WZtkyLfqLyh1N+Aze3pf7N0jAW4mtVx9R/7TCGNZ3/KqTA1s5K/71gqkPkKJ+XF/uNPyt6HHahhJhBPbrLngTDPoSzfFqNDSJq5t5Zy1tg/npf4Lq/oOTBg3wJpfu+/So
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(376014)(36860700016)(1800799024)(23010399003)(10067099003)(56012099006)(921020)(6133799003)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jJw6tHj0MGexvx7C+uYrYTM9WaMLB20ead1MNGAc80a+AGaQeoHcsKROSBbz5wBEy7/CpiTGQymfuyFMYIc0zdJYNSM5NIcVAaVrha3uqPLcQNNhOzRJTAZ9WNKSTsqqmknORd0gwFXrtQvMhBWEPSBtPGLGqcPBURwCB3O02Glu0tC9N5uWxLcywI99inE8ij6xhhzxlFZcOxnA5KP7/yVE23JQGEolGtHTcAAErtkbnem1fMC0IKtmsX1x10b0D8DLStBzjBxGTgBe3z2Yprc9RsE74PgCqcrnn8kHojX3OsvfarPNbKQsvh7ghalAs93ZN7VptyNdoEDG1nj6htoXeoUfdIhqf2qBHxA8M0EghMlno4Zv8IxYFUya7sCZuZmQweh1SF2BufElWSfgTq2+JAP3KNo1J1l+q4Qg8I0JYlBNdOILsJbrnReQQnyl
X-Exchange-RoutingPolicyChecked:
	eIdEqXjCn/Z+P9ZR79jrvcCZ89DVNVKBP5p2g0BlDtAAz2rDZx2Cob4xrkvyrWR7SymRpOHT9Aj0ZqNApkcAMinvsiGk7+Bl9uUjtOa3xQhWbCfY3n/8avtHZdaJlM+s7KZTN/FhirPPzh/7ZqHi67XL8ulr50sUVlpdTKslsvqAugFZyl6rpS0rAy68nzPPN/eFQxM24vJSOhm6wk1AkW1nFJegG+a222tOKVGhnRp9mYSp6b1axjmgVVo25yWSiUw6ZsQUlrK9kDiZYHRcnQ2sSbX0F8K8IzTyaOdUQkj5v7agsDrpzWSKcaMyzveO3XoIvGiiJvG+1J0AHuS0QA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 06:50:00.8811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b52faa-8b92-4182-e393-08df1875b95d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E60.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7767
X-Proofpoint-GUID: ml6UGvSFy_azV5OBW6c4XF_IWwItKtAd
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab2251f cx=c_pps
 a=7wCTOXyfr6KSlQaUtw4X3A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=HBuPRTQpjp8te2fZSmQA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX5Q0xvVtWrPDJ
 1CjI4kr8YYvxj+D8z026VHVVIGqyUvLfyZZMRgvcYQDKLSahijrJuJqV04GUfv0pjMyjmNEkdRS
 1EyKZy7YSlY6Zs3MqXrWhLLB3pPAG84=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA5NyBTYWx0ZWRfX6TPiGcxy8Xd8
 EsR78+K2aCVoGQcvv1Cp/qbHhvM2I2P2V455RXJqbpY4UuBrjWO0HCGejHHbagKUgMGf3F/TsUj
 Sxf4oPvRSmT7rrtqcZ2xtjDcKdqAXTWVrd2BJqxOQJhIF3ULpmEwGK1NQ3MKCRU3EgXILIP1MSO
 4pDL8FB1ZSwW9v96VytTPJWB8h7qlHyFHpuYigXpvK5L8aqWVWehv+hvHA3uQekAHsEYGrQRZLX
 Y9gyJgnOLUrjxSFCtAXDJCHJlDUyV6suiB4cSlIxqjJHoQMsEog0fEk9Nj6QPdqBbSe/X+egV0v
 o8AILUZUW3R2MMTq+Vq9OIWzGofudwEoxN9noBnuF0JDHuBZREVyTAUkzxvYNNVEiJyyuBX5PTU
 IwsFQKrmtqpdTuSsGXEkIXrxp/GwUOCeSHF0qyGbEiRcSkd9v9IQkfBCEOBEkwVixs9MBL5hdKP
 S8PwtScnSru8btA8JrA==
X-Proofpoint-ORIG-GUID: ml6UGvSFy_azV5OBW6c4XF_IWwItKtAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220097

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
https://github.com/sskartheekadivi/linux/tree/dma-upstream-v9

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
 drivers/dma/ti/Kconfig                        |   20 +-
 drivers/dma/ti/Makefile                       |    5 +-
 drivers/dma/ti/k3-psil-am62l.c                |  169 +
 drivers/dma/ti/k3-psil-priv.h                 |    5 +
 drivers/dma/ti/k3-psil.c                      |   78 +-
 drivers/dma/ti/k3-udma-common.c               | 2606 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |  207 +-
 drivers/dma/ti/k3-udma-private.c              |   37 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1523 ++++++++
 drivers/dma/ti/k3-udma.c                      | 3126 +----------------
 drivers/dma/ti/k3-udma.h                      |  602 ++++
 drivers/soc/ti/k3-ringacc.c                   |  177 +-
 include/linux/dma/k3-psil.h                   |    3 +
 include/linux/soc/ti/k3-ringacc.h             |   21 +
 16 files changed, 5917 insertions(+), 3062 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.54.0

