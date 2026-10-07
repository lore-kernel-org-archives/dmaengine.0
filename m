Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A451147A87A;
	Wed,  7 Oct 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369033; cv=fail; b=W/BK3Pl584Ox0oMzg/Av3o7aEYydYHurzZejdzYOMAKvPsRysTrDJ2Q64wvWv3luL6A2/SrVPHo6hV8g4livpg2GvrrA4x3nUVgjlmOD9iPfJZrEqnihUTXOtO8CarVDm4ChOl4CK/HVxJBbyYMdUVIQscgs1/H9FYqboTN0TCk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369033; c=relaxed/simple;
	bh=nIXCS0AT+pke7kZn5e40tHkjfpwqCtxPeKjmJAXz/Ro=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hKeeV3YU5Beryfy8cLO1Wb8ORobl3cr4UrGmZXQGxl6oeag+sKGeXJBJmpfc+QnQaBO4l5vI/dGgktX9HCntdU6Y0bp4bChKHqx4f6oJxHU+uZMsD4N3ppjF1QrxQgZ9/X3DTmQN+H8nNSNpkdz5mt2ziDqMaDc1fNTbkoJcGxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=WAgIXQuV; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=QjQAhQyQ; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="WAgIXQuV";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="QjQAhQyQ"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977k3ZE753289;
	Wed, 7 Oct 2026 05:30:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=uld08NeVth8Y+
	A67KQzPrFdUKU3Rx/gcc2sOXGIsyBw=; b=WAgIXQuV9Upqb7oW5BdS3apRcv8/R
	TzdqcHLMBtasqFgIJ9v+M8UwLtf/FzpMPAoFo1q3X6HrDAUq0RhKdYFFxOMQEv5p
	k6UwsxfGuFzDNsZQeLsKWbQpP3ocuRkkNexcMR3n23t278laugFtP9BpnPSeBhRn
	oLIDJ16vg9xPJFvg7ivSI08icEAvCzvomS3M4igITMYck4aJEOPnmpEKfz09Dy/o
	8bZvgW70pfZVHgQPuAACLHt7568BQDF6Cn7lFgDQt5BT/tzY5UvbaZlDKCi8hf0q
	yyhG3lD4slZO4e50sbE2K+k9nmTLa5vGbM+/IGWa1xF8LiOEV1p07TmDg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010011.outbound.protection.outlook.com [52.101.61.11])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h5hw78ppe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Oct 2026 05:30:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTOPRVeyuJv8hMx1U0Pt6AKPhyDvGgZaO8HdYUHvE7WNg4MX9u4tlB16s3gcnTNEm/wkelYcsmG9gjnIkvrA5lZKzD1zWYbcR2Nk0doxA7J7HETYTwUE7h2c7RX8dl+bKkL48f4mPw0BT4wfuVWcLyL3O15wSN5uZmflKLet88OAGkivTAX3gvyBFHhO+Fc/14bWhgkNMc7o86jPxy43LmFTJmHDPGUhR1yWkegTatYoHGGqmdFhG7qdtHGWzfSInMXm/lU1LNraqW3t9tj973Gm9+zyJq1y3+t9jkxGyUQYCFKRUXFn3rvI2BKMmiqTUrKzPERIg3azki6qsGWECg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uld08NeVth8Y+A67KQzPrFdUKU3Rx/gcc2sOXGIsyBw=;
 b=fplCsVr/QSKZ1AjUI+kD6iHSGhbPKoacAnuKMH5awS1NuMtjvbZDvoR2tyTj8QEZ2gaMzaYBy4Ji3h2obyMqMuJd9D2Gy0Q4bGEz2SoXdQGixy4Vy1jaabqZaqrov1e7pk6iRljgJYNnoAKy7aR8XWiFAqQotTAs2CNU+psuV1g3P6ugKLRyPLXa7gDzuzZ0eN2xCHSzf+CiJ0bcDk6GD5JPI7qkuFroyQ+xrtKJpE6gTYWovc2ijY0PdbqdiHR1QifxrJijanvDPzBQh0qnGA84a3CBrN8iTP03YiXjnL6leONMWb3G6hA4xjiX3894GvMCMnt2j/6DJwvn3VVaxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uld08NeVth8Y+A67KQzPrFdUKU3Rx/gcc2sOXGIsyBw=;
 b=QjQAhQyQybD3n4GXi+4cCNsKghLGWPwrvO5e2FVvWRHFl+GIdxlQE/WlKL77yJRhrnZX+M2WaAge5x/Z4E0Xre3Yh+DMt75Fq2XcUU0FH32drK7z6/EbiJUvQhpuUQ+7Io4LwLvhd3EbO51fiNnFj82sqayrS+gCmDhvZjOvung=
Received: from DS7P221CA0015.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::6) by
 IA4PR10MB8657.namprd10.prod.outlook.com (2603:10b6:208:563::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.6; Wed, 7 Oct 2026
 10:29:50 +0000
Received: from CY8PEPF00000055.namprd05.prod.outlook.com
 (2603:10b6:8:25c:cafe::40) by DS7P221CA0015.outlook.office365.com
 (2603:10b6:8:25c::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 10:29:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY8PEPF00000055.mail.protection.outlook.com (10.167.247.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Wed, 7 Oct 2026 10:29:50 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:29:50 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 7 Oct
 2026 05:29:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 7 Oct 2026 05:29:49 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 697ATiSi013473;
	Wed, 7 Oct 2026 05:29:45 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v12 00/20] dmaengine: ti: Add support for BCDMA v2 and PKTDMA v2
Date: Wed, 7 Oct 2026 15:58:41 +0530
Message-ID: <20261007102936.2402427-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CY8PEPF00000055:EE_|IA4PR10MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 20231b2b-2b04-4a0c-8706-08df245deb0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|7416014|376014|1800799024|921020|56012099006|10067099003|18002099003|6133799003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info:
	zyqiJ2qHeShP0FYc2edqJHEZe7q+owIjb+U76FIfSonXlbpLGEaLYYgR8szma7EZcrpaybn+qjjIn+mQ3ujky3rHy989e+296q9ElRAf6aCxmB6E7snilU9Ep73BQ+6XQdAeG5h7l1hNAj3VlmyVFC8OjBwiPzMJtsrMOex0aTsIn6Ok6yQaQVbZ9KSnvnB/dZ1avc8gdEd8VN8JXixETQ4embAh62qpke4BdejTbkafC/krkJpm0SCfxHpyOkGm0u12eS8GservN5BP9VjtRhaSJxCzXRu8gtCQ9Eu0MHbTF7w9zfTjLaG+FCmyW79WXyX5qsh1u0xe8q2nhSA0kg4fmoCZwyFKMl54727K3MNGKOgMd65OMhFUvKnUq74AnA1p8fMUQ/c8mllRZ+RvGCgyV3NRWy3+Y8QbaCrF4XLUpwT43VD1iT9Xi/3CIEoomuUzrRuqRviyCu/1ugUHzTVAROYztf6qbjKnWDJgQRcrXg9V360pRaZFJ+xwZXgtQ0I8oa3pYN6OH/EAKq1ZtYxqGsMqRJvfWT/UMTRiZ/SQI3D009KIw2+XNmg4tUiRWSBRItdkKoL7ij7lRlm+HDy3/yXH5b/7Kp8TH50Bwes9YHBvlQrRyf3My4ewtjSF0hSnLjX7Qh+qGTIn/ftjjb3PjGHRkF7WxbfkARnSKGDtx0nJDxrmj7U8wCtRs0SW
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(7416014)(376014)(1800799024)(921020)(56012099006)(10067099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wkfn/s7DfTvRf32KHEusPGdxVT0796BLbefn9Mu0enqvAswWp/IzmGaMaILxhgw5DQz0wEynrSELGIsft+ukKu6gIRmATYi9rU91UJcjIzgz6EGS1K0P6w6SaqlVvDB+Hjqmp3+UrhYf36tlqX+p/lhgANE8qNMKeXzJtkk0X3zZ4oKlhpIJlFK/uxlVY6g4XEZK3BvqJF8cdYhjurCxiZCsyUmML2Uch6Q9CdtHTlw81DloW5pXeQpSdHr3EgcCWYfKuTgPY/mjv1Bim5l+iXTjZqG8Ym53b4V2fcZNnB4zOSx7YjsnDQBDklLmVBscHYdoxIq4sMIlVWPzx28HQ1JL1awnwjTc4VlN5jHm4d9yTzS870dg5ITLALQ75WcqqS2RckapkKpLoTwPgWAAPb/M3nuxwXuZ6gcIS+oqtCdMOCkpHw6tgszlxvuVzyME
X-Exchange-RoutingPolicyChecked:
	Mkg54ei/OdT2AcYSgjschX3AN3t41yQn7UHN5Bx8sUw5GmFbNizKV0MWGlYJEVmXo0ptaORnDzqxghbguXN1TH+J0YFIrvkMjQ5y57kS7WUmxb5BsOJ1576plI+IZis/yy5r8Eu5RCCmKvEh4MpHhfxUsLwgl8KpxzF0Vfk1gs7czwuRHaULxKaogd5NsSMsgzkfgJkyBYofW+lKQfpvSObpbLSw5nfNvdSnL7LpjL38ovn0qKF5NsAJH/A5RUWq+JpiqG0XzWni7JLlps3ULPjThf25RyAeE6uAydHPfzVMScyHgI5LoNiibdxVh/4G6CdFD4jsIXNBZI1g7jTWbA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 10:29:50.3287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20231b2b-2b04-4a0c-8706-08df245deb0f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY8PEPF00000055.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8657
X-Authority-Analysis: v=2.4 cv=as8nmiZV c=1 sm=1 tr=0 ts=6ac61f28 cx=c_pps
 a=UjDdpJjQ9fE5FDPsVaFzsw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=c92rfblmAAAA:8 a=qV_MB_C1Jj207ydtjJsA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfXzUF4VOJTyZP5
 /hbIm2khDrCAAMs+dxvFnZWeF388jJGE5VA7MSqwFCybxecM0GB+Q+SbOauEfEHhFfXx5T+m+hn
 LdlWkTEHizlVIyCYtGFtbxG5A/iPp1s=
X-Proofpoint-ORIG-GUID: yP05F0yWHOlegJ0ZwyG4DHpL4_g_gThI
X-Proofpoint-GUID: yP05F0yWHOlegJ0ZwyG4DHpL4_g_gThI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX2CQfyZSiGnFF
 ezTwj87Nok4OpeLnaSGAtFrJnCZSWONLUhORqDKofqb3As3PvPElW/c0OEU2HJjT9v6MlL5sif2
 UIpBRdAkxafhJOHvxYY6y2XqWIdU14tyjUBuWxsaAekJM5CpsrxVpqx/KvGBNGuwoDeVd31u76g
 mYPzkM5PD4w/0XYTutR7mNpb1MF2Kzf7TrwrTzTnKutIe/p2v4c77PPryi0FDoNWYJNBmMfvuhv
 nCqjNHRgJITQ/JLS24oIpdVsbHya+4SPwTkr7EOpmACL1EL0/H/w1Tpi1KacYV2UX1zPipX5j8o
 B6VB+oU0hnVuj8QNTilKRf2NmG1x2FIgu2saTWZZbPmPuqGXdsmCmFHwbekH8XUtwNfHfS+K86O
 KJX3Uf1vsUPgYc2KSc6QCshxgKp7BtwtjicSau+YsVfKjm0h02u1AgVCSggUxWRj15AKij2U/2V
 MJJy3B49NxJcd5xH6EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041

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
https://github.com/sskartheekadivi/linux/tree/dma-upstream-v12

Changes from v11 to v12:
- [11/20]: Split into a pure #include move with no functional change,
  and a new patch [12/20] for the module-pinning logic, since the
  commit message claimed "No functional changes intended" while also
  adding try_module_get()/xudma_dev_put().
- [12/20] (new): Pin the owning module in of_xudma_dev_get() via
  try_module_get(); add xudma_dev_put(), called from
  k3_udma_glue_release_tx_chn()/release_rx_chn().
- [13/20]: Use readl_poll_timeout_atomic() in the non-TISCI branch of
  k3_ringacc_ring_reset_sci(), since it can run under uc->vc.lock
  (including from hardirq context) via K3 UDMA V2's autopair-timeout
  cleanup.
- [17/20]: Add of_dma_controller_free() and
  cancel_work_sync(&ud->purge_work) to udma_v2_remove(); add
  udma_teardown_rx_flush() and call it there to unmap the rx_flush
  buffers. Only compute rflow->reg_rt in udma_v2_probe() when
  ud->rflow_rt is mapped. Revert channel coherency on the
  err_ringcfg path in udma_v2_alloc_tx_resources()/
  udma_v2_alloc_rx_resources(), matching the bchan allocator.
- [1/20]: Reword commit message - the fix is currently a no-op since
  every existing struct field is already assigned; it hardens
  against a base_rt field added later by [13/20].
link to v11:
https://lore.kernel.org/all/20261001084105.1692228-1-s-adivi@ti.com/

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

Sai Sree Kartheek Adivi (19):
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
  dmaengine: ti: k3-udma: pin owning module while glue clients hold a
    udma_dev
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
 drivers/dma/ti/k3-udma-common.c               | 2653 ++++++++++++++
 drivers/dma/ti/k3-udma-glue.c                 |  218 +-
 drivers/dma/ti/k3-udma-private.c              |   53 +-
 drivers/dma/ti/k3-udma-v2.c                   | 1587 +++++++++
 drivers/dma/ti/k3-udma.c                      | 3127 +----------------
 drivers/dma/ti/k3-udma.h                      |  572 +++
 drivers/soc/ti/k3-ringacc.c                   |  209 +-
 include/linux/dma/k3-psil.h                   |    3 +
 include/linux/soc/ti/k3-ringacc.h             |   21 +
 16 files changed, 6085 insertions(+), 3064 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
 create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-pktdma.yaml
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c
 create mode 100644 drivers/dma/ti/k3-udma-common.c
 create mode 100644 drivers/dma/ti/k3-udma-v2.c

-- 
2.55.0

