Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC637104C;
	Mon, 28 Sep 2026 02:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790564328; cv=fail; b=iMICA8mz4EoX155hMnJy0rncZTyC+vt3fUIOjxV8i8zwJdFF/CgVxRL/3S1IOIOmbfYL+Q1QdH77nFrdtKLlUis4hEoT4dMfCQ+T28+UgFd2LYcQykWK/X9C2vGh6FX+q9eyyv55K//dKHXmi7LQszebGzRsvZYjIHhYuFW68gA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790564328; c=relaxed/simple;
	bh=11j1jTPQWx54NgtcyAtsp+v2FoGJUFSi1EctbLr2AD8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XmSKh0KEFEzfGvtNOSIkgEerZkkvUYBrBQoBbUQ7SJtlsU9eD4BMbnTQgPGSfcc0mb3ttD61vZNlNFay7N4M4WGjVbun130k3WFgd0zQ8VSaf9kT3MLf+mq3sX7nqiG1EBbxT24+mypcClmZuH854KuO/TioAbcRv64ExYgzVdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Gh5PXpNH; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A2Jmm1DO; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Gh5PXpNH";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A2Jmm1DO"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RKXZrt2806195;
	Sun, 27 Sep 2026 21:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=iluZSBWdipmg4
	glFFcLS7X8UyqNOKqQG3LUUvFsIyBM=; b=Gh5PXpNHT+l2ExxWOgCpEAaP0uE8s
	hRxccbGvXz/kFv/41TBKx7N5cGZ3OMCVRyCEGcXCB32gcF7gfll03KOBmuEfSll+
	7V46zH6Be6v1xv9iOdB7nn/aHHDMRHnz2DotS0jJo8ve+2INw9Wuaasje7J30RRs
	yOyPDmdfoX6n6AD4spX7sVYDiAC7p540UmdcaWrxuhRAWNW5Y0+VO04egWmcn/3y
	UdWJg5kaZ/Z6LB5JzkkRFQx/PvHYJGukofPEFDTeG/Stp+MDCR01wBiMetIT/lYM
	VTc8dwuYoe9Nm+7caFxt0aT1DinJ/iOBKyUXJhHzSDLKchctym487lbow==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012071.outbound.protection.outlook.com [40.107.200.71])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5kfnm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 21:58:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUo/CwRV8FLpPjsYMg3lVtTlxva9AEAHlC/LESwZIgxSGTTVaTdhoRQHaQQbwijZmvxPMVS69iIwJsQr4IEcBaywIx8Ir8kHuYCFGAIaMrsng/9U8S7tBslbh63JMI2GH/kzlIrMOTRiCkea3N+kYbqHegaGHBgPDYo+UPOfl3+UqO06XDZRvOdkR41jfR8BEMQ8IaStHwHdrAMg+TKLB/pyoK2c6lhB5WGRHk/90+L7QEhQPyERs1+D69xai4MYEjBk6CidS3Zn8C0AuxI0BWZjZqh3e9sYwDt8uu3A/CCJ1x4JZlcthNTLD0wtOC4ruhoaB8H5rwlt5kSDqfzYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iluZSBWdipmg4glFFcLS7X8UyqNOKqQG3LUUvFsIyBM=;
 b=Xq4BZzcA7SKWA5Q/7N3wjArQXqBZbRARYCNKyHF8zdwMtBUNM61Cb8ndnXL/V0oEARC8OWhw4AvOTph/CIGumR/yfRz74dyzGru1fnQmmsYdg7zW8RAkjj9sJuGH/phwYJQ5md/gWDIJHJTEaJB35WWCCsnaoMACm58e3Nt8kz9YEEiyKtMTjIrDlVxhxNM4As5Wfv1BTOZyBIz8OHm9Hg8LTGqLpdAI6DvlnHN0M/PMqoBsxsIPtkCFQkKCwJAN3spEXpwPPHaIK3V06/tweayxieHEYHMVY+dQfre4+V9b02gu5e3BtC92xnEFQGTPgrMVDz5dhjdAexeMJrsLSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iluZSBWdipmg4glFFcLS7X8UyqNOKqQG3LUUvFsIyBM=;
 b=A2Jmm1DOyqWNxiaGJDf/b8kw+eG2Zb6kJ7jKwhGTZlIeFog6ytKFNlPz1KTm3ULIMCMiA+PcNS4FwCzp1ECiRzzHR61yKalVqHbQj5/nLbGWZ6Gr+hONNItDlnxWxhvEbWHw8cyLhVV53wwMZ53CajQvkkABCtC7Wvto4JAFnFA=
Received: from CH0PR03CA0205.namprd03.prod.outlook.com (2603:10b6:610:e4::30)
 by CH4PR10MB8074.namprd10.prod.outlook.com (2603:10b6:610:23d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Mon, 28 Sep
 2026 02:58:31 +0000
Received: from DS2PEPF000061C1.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::7f) by CH0PR03CA0205.outlook.office365.com
 (2603:10b6:610:e4::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 02:58:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C1.mail.protection.outlook.com (10.167.23.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 02:58:30 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:57:57 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 21:57:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 21:57:57 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68S2vqq72256662;
	Sun, 27 Sep 2026 21:57:53 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v10 00/19] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Mon, 28 Sep 2026 08:26:06 +0530
Message-ID: <20260928025749.1055383-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C1:EE_|CH4PR10MB8074:EE_
X-MS-Office365-Filtering-Correlation-Id: 873fac4d-af16-4b7d-71b8-08df1d0c6079
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700016|23010399003|10067099003|6133799003|3023799007|56012099006|18002099003|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	8o5TXQXzhHW+Qw2VrtMYICyJA7WfbrAopLyKq+y0rFzG4AbCPwLR2afDJyvO56vp7yOdwV88ry692sSzkpAgcjEobQ8vygzP/rpN6LtufvUbXnjeXPLpGhZewIfRp0UvrM1G87To/4C1SXY14ScA4tXZZdigbv9KwnYRRdnLMx7RLzU+EPIOBMP1ZFPtz5QV4u7H+HWJfO9vPqGLX1gWoF2Dfb4X95Omjqcgu5t2UDLjDuugRTmLg1DwV1iQac7rv6SzYd/srHUeedXW0muksVZpav8ryQwfSnxQIL7LnpZfc6kfislPAlVGa207t4gnmAY7C4Tg4h8LwPmohSTHYpHX+w7GxDbpmUzVhFHw8QPSMgZ+KJA7pwmtLaM81FeDwu2rYRoqruSgCEwgnqNYwxMet0c2H1sb+AMK6EzpGvXzwWHvzzqVQHk0Kbwg4jd2k35jtjLF2Ubt/2N03CanL9wB3F1FlEJjpiCv6QjwVHbbb1986eLCe70Mn93xnvYzTSUtvh6t5w6rNkC1394S9/Cce7uftqDM205FXNWYf+Db6erwgl8+hH8CL95SqMFXpj29PjvZhWMWEdDQ9G6thqtpTHdG7HUxoV7xeZmB5uaLH0s9DeZaDScrVq8N3hOsommY/YIm2FGPWssVOUO8YLoInesmUsnfpSDSDuorUqBaqPLE3Ts7qkURFLJHhJvk
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700016)(23010399003)(10067099003)(6133799003)(3023799007)(56012099006)(18002099003)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6nXES63vCwnurH8/Jt9B2X62r9IXes/fG69Mquuxqkyr7QFv5eCwVOleyfu6+B6p7NE/d61iSc75jzdDfIjpqVbsi43G9Vct/N+aZ+f74TsZtiRQdpgOulg7wZaUS3vzbsQv/w2z9h+L4E9obSibjpcRrsxMmkzM+PFuHaR8IpAx8/+U/jubAT02hJS8ss/Fmg1BLSYqfy0McluwIkehgNC/9LpUm1Rp+IKiFqLR0nrF1PLimwHVKrh9rYMtLroW/KqqP2xOKo5f0AYOAb9YrGl3vwo0tX1Dzw4LctWH+pbKwY4rSk793jaJB0heFdwYplQakdjkmc9vJPeQVBc6ahFrS8jGgB3hBhsJIYbDqpiJyq97sgIjl5WfR0ATlW0acATqqFpQtx4InOLhspwvpw7juEHJmwi/4rDh06D29lCOcTzi9Gira82Nm//Ig8ru
X-Exchange-RoutingPolicyChecked:
	sv9PnAoOv3LPAzgQ8RjCXGu8OveL7otYSU8uABgCNHJwsC3r4i3rKIo/hqtBwy/QeXkB7uYtJEtju6445MsvpxDOLjjR0UmGFY3l7Yu1FpYA1uxLo5DEP0f//S8ooXtcRmXGySJMgeaegHC/1qFEoN7giF8Qf4ubE4PO2mxLzkIHaMWrzxs3clm6joR8D5AB7rYN2mFbIOH8FhV5Aajfe83bd6iiXULU5+SxcP/KVijK+spPIQQkfCL8Q1+bf8d9QuaWU1hVabuEbRMHfjWYhHhTy8wl/OOs0/Nw+b1h2UG4TTGcvpJUPWJkqK7l2RsCzn74arn2YgzQ4/LrGRlbqw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 02:58:30.4246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 873fac4d-af16-4b7d-71b8-08df1d0c6079
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF000061C1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8074
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6ab9d7dc cx=c_pps
 a=il/B+BFNnLmOqkoxAJ/ciQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=NEAV23lmAAAA:8 a=c92rfblmAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8
 a=orIcycAgHQZ1YkOBMwYA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfXypsmHG/Xm3Mr
 FF768SP7VKtb89wnI7EfteUBpldnBZtEpCpyptjd2gliO+ufUjPia0RVEytWRzAmYZB1BM2bqbW
 Z7yigvAvGO9Ixe+QiJ4R7C2cH8uy6QTJ5dUGkh0KDjeUWT0lTP25xqD+xDlANzxcfDGhkeDX0+N
 jPgD0IQfXyyO/AxW1Awz3mONdWIkYmGpmYTUhD7cJMeHN4b4jKEWQY5r7HODstEqHjc4JmbWbma
 3U2pDv1e5V0qtaGId5XzQP01H+jpL+wJdncUTB9WsjY6icdv3AVtvH7OExbACMZM/WDQFaHgQpl
 KM5H7WkjA50j40hKVCTfUPALJs+BeJ+TrirrjuUT0ylL+3nIhFN1kxRbdVZ+6vF2DmH1sizX7Bz
 8AliqrZ1lBFVwGhQ7ZRq0nb/+3w6Y9kjmC6QeqNWyB5eFOt/JWuRe1oRast2A3Jp376CtldvwGj
 V7L1KeKDCUzqw4CwmjQ==
X-Proofpoint-ORIG-GUID: lIivAbiymWmFkpAOii3mSsjNW0XSfnOb
X-Proofpoint-GUID: lIivAbiymWmFkpAOii3mSsjNW0XSfnOb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMSBTYWx0ZWRfX2+3Ud8w6JFXX
 IDTz4HuwqQdCwlUK+SyTzzgjLg2aXbSqW3Ge2DzVz2j/LC0dC2yt3HzR7grc6fTy7I6Oe/3FWqT
 sV2SdVcTnMj6iHMwhwzf2sje8tDT68o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280011

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
https://github.com/sskartheekadivi/linux/tree/dma-upstream-v10

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
 drivers/dma/ti/Kconfig                        |   20 +-
 drivers/dma/ti/Makefile                       |    5 +-
 drivers/dma/ti/k3-psil-am62l.c                |  169 +
 drivers/dma/ti/k3-psil-priv.h                 |    5 +
 drivers/dma/ti/k3-psil.c                      |   90 +-
 drivers/dma/ti/k3-udma-common.c               | 2609 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |  213 +-
 drivers/dma/ti/k3-udma-private.c              |   37 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1523 ++++++++
 drivers/dma/ti/k3-udma.c                      | 3126 +----------------
 drivers/dma/ti/k3-udma.h                      |  605 ++++
 drivers/soc/ti/k3-ringacc.c                   |  180 +-
 include/linux/dma/k3-psil.h                   |    3 +
 include/linux/soc/ti/k3-ringacc.h             |   21 +
 16 files changed, 5944 insertions(+), 3062 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.54.0

