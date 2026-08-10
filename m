Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85154412C03;
	Mon, 10 Aug 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374924; cv=fail; b=GHxjsdUYwICCOEz+Vll4R8MUEz7LRZs1ndB/4MoMPD3SoJZH3d/oTP+0wrdE3aY1KO4duI0xpxQACj60KUz5d9d1DwXcwGCYCPjJu4UgPd8lS1cXSua3HwBHMdS2UDXWw+wPBxe4sf5Kg/vhA12F/nH6tKtX+x6aznTYXAKmFZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374924; c=relaxed/simple;
	bh=CU7W2vYtweo5rGP6QyGakcI1jSZHIJnUwIo3phUPszU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mhflUsGRDgMoeCK+Dm4eUNARKcC0Q3DSjMr2a5B1cJcH6P63JptMoKEQ2ZNODLyvYWE9q1uEbksLksx9slfZcctaTXV2dhLUXSHC0l9a0Ffy7JMmla23aymyHRMISCPQpMdPM01XZC0gaJFh3gINpHq4J1u5u4sxinI+5W1i5dg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=A+kXlxyW; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UzwuYvam; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="A+kXlxyW";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UzwuYvam"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67AEUdsA3620486;
	Mon, 10 Aug 2026 10:15:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XubUA0HkLFYA2tZzHzYbyBnBGchHyUqd3Mp9cCxPC
	7o=; b=A+kXlxyWv4oA9VslYY2Sr29lSLqnHSMVSFmB3UrRKejadA0/sXUR+E4Rq
	p/+/t1Th/nMzxLJ/ize2Wi+5oA5Ei9+YPyrAIgE7WVaryWS9J65mFC3Di/x+SOPZ
	if5VZtIj2z4ZQ263FBRjWOr0t0IBqfih3q1zcCECn2dNtyYbw8G2z35M4dBP/fnh
	lgFOU3Rz4euMQPjYJ71TxqDFutLrYMp6ei363SO+0iBL2BpZUVdT2ZE5c8jR+fSV
	8IcOeHQxkv+XHY+Y1IiFUGUc/txXPxG7dmXhNdbjUvloYKRsnx5Eezisw9NC+tmv
	tfyisqItb0Q18TmhWow1CesBxYQBw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010018.outbound.protection.outlook.com [40.93.198.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fydt79gw9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wORZsIchPnxwu18Q8kuNEo3v3E6dhIOK2iU1lM/r7Vq3sqtPA1Q98bplEc4n2vAH5lSWCM3VXbZIGs2TRLNMPyue//THVvJ3rAhH4ovcYPETiizfSRXls7RBp07dVp5GiO1afXT/tJ/kXbwq5eNxpnkSl0wXIL8p4wjSDPUinC4iSjgGsIzInYEAIvVJl89+CMUGO6CFzoZHAhkmvTRC5FTZbUw4QYhDLcG8nKFIsQhYAMeUoxjW7E2Ij5mBiJCJ11UZ4jzqEvLuW2WTarM1oA+qhUBEU/QL/6D0NaMk3aexM5QdLdUUHvI6j8/Oi2osweim/G3a8xOJz8StOa3WlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XubUA0HkLFYA2tZzHzYbyBnBGchHyUqd3Mp9cCxPC7o=;
 b=Vuw23n028HRxzwStlD2I9odsbS+/3Fh+ePKEwNMbT4Qph7QSinWZF3eOxNtZlApItfii7vpHQRUtyAduSK+o93x6gcrt4vLHCf6M+HDWpF5vaC5ABDOTfxSOArzQXtDj2olr5VKNSJmdZAKOxM54rYSHKuuGvOnqZMvgW56+e+VIlB20fGBTKO5E+7OQ2GUNnGjEO+AoRWhcpuC4vN1w9i/srkCJXbMmqCXycYqnCBt67GmxGAZLgzz9blOVLzCUwIrqrUiQ3QUZcwQg6pCsPQQkdt9YUIHqX15L34Chcz/fG4s2xDs23Smm1deglUUB897OwkL8KQ5PECfIBuuGtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XubUA0HkLFYA2tZzHzYbyBnBGchHyUqd3Mp9cCxPC7o=;
 b=UzwuYvamrxmCO9iqQIJnIur+50Q+8aJN0Pwfnab+6HeDODuJXVbLEqNgHbDId0D93fcaaw2MDNjdl37ojUKV3ndpnqQYbiiY4WuZv5KTUwSJj7touVz97R1R4XHKtcfRTLcdp/7bfO7MSXzdvwa/w43UyyVC0v0OohfvPqtDbKI=
Received: from SJ0PR03CA0209.namprd03.prod.outlook.com (2603:10b6:a03:2ef::34)
 by SJ0PR10MB5720.namprd10.prod.outlook.com (2603:10b6:a03:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:07 +0000
Received: from CO1PEPF00012E80.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::a9) by SJ0PR03CA0209.outlook.office365.com
 (2603:10b6:a03:2ef::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:15:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF00012E80.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:06 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:03 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:03 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW22648613;
	Mon, 10 Aug 2026 10:14:59 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 07/19] dmaengine: ti: k3-udma: Add variant-specific function pointers to udma_dev
Date: Mon, 10 Aug 2026 20:44:01 +0530
Message-ID: <20260810151423.1948224-8-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E80:EE_|SJ0PR10MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6e7cc8-979d-4bec-fec8-08def6f228ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|921020|6133799003|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	prwuRsEvokhjwI1fBIjvwN0b2cHe76zWgP5wOOKJHzCWwjjF1GJCuEj7c8LmKvNKLnnSO6+MsoJs3lfnIN3Uxet09XJej2jeaLrk7S6iekCPwzCuPqQeHjF1iRbyCUhNo7hlqkQi/sYvcqUe8NE83+IyqWFMnHgSl7/KuhjIWiEmvpuTUyZKCbpBFRSRvCC0NY7pzU741azj93gHAUktVegRLhu2RVMhaNYgWdSqqNdjwC7gWsv8MYBvezLBlTxYOBeNzUpiRF2kFy+8ZsMnOK6/t8uqSPY0hmOzDKBehTHnGLLSY6lQaIULa2I9rlmuA6PVwuB3BCfKDBvQxwbtLtALErm07jHeRBEJ3Ah1UGvlmLYPz9nSNUno18Cg04JE9QSdMB3GmK+IeF1P40SWXGGZ0d5r/rNnZwI6V04CUpcWQ2vFBU5uedFPffupEm+YQ7/fhFtWQwIaZdISuILSXbg6tDmIklY3AVoQq5R7X71agDnPYrRXQ19zVgiG7GnSL4/QyAXpoHy5x6sEJrHvUsce3uZNzc74TpW2avitq0VliE4xn7fwDbf1jp07qOiOMwcKJsIxSCllXdacjL9t9SbZOE9OaGmy5SVn58A8B+sOOzH8zPzK+2PsXiZak1leIcsTCszdddUANPWMWBxGOkZPzXSoFC7krP3AXfpNHadPO9BGabfusNovXIH9THHwKX3dE4WkdcTN/Ze3DJNHF3ZysIy8rBUKyIHlSjXr4jKcj3u+rJ4SdKx8UFJTMq8S
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(921020)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Q+g1ZHXFi7vY6ARpem2fQevU/2+X5RZpx/6rz2PoeHpPMiIdSgFn+ocpR8PII+l3EVRyV6x+yNAX4LyO1dGw6Cx4+ONPBguLe6B9SydLKIeT5F+XsdZf+dMPHPcqHX/kJ3CwTwcy2xKNyl26EoRBiYpDoUoQQMRPbeL5Z6gcNVo3GmE9a76FKKvrfJ1CR52FQEne7mXUXEwpwGwt2HcOf7KZZmKM86M583jk6hn5EGXQ5hnD+dHFnOtQ4Awp9J1RYJlkglwVENK09/7J0az3+vnigsscPMMSDvrWNFRx8pBkKJn4Qoa7eb/JBU0o6RJmJ33Tq4YLAPfdC0eJUEjJ34nWjdLXEu4Yf7fQwnXuv8PJ4mtE2nMjIy7ovZuOcPW9BULPxnKTyJ3jIZ2OsiP2jwNG0gOJexaMED3YF6ZD9s8xIT3Lgkafq9mDM5VwjSNh
X-Exchange-RoutingPolicyChecked:
	Y0ANSNBpiiiDv4MhqDgic61yiJUTsICWMXztB9fZYzST3xpPl1Xqbh31FpfQNsNiJFr2BQQ2IXN6M+2mUnRl7Zrepdb5FsFxe2D0/tB0Zl2QUOsIfXYgfHJ0o45vNqGHbJTkgyOjj91L7/ixdfIOfYKKKSZbzEBXunaX+qcCwT7Ofmiak6LunvKsr1ia1ms1TNNDCtg2AMFzKIFxlZi4Kc7bLxtKQdQ4vW+1edHM5NuRuPpHLrUkywwW4a3ncnssgrC453FkEY9uJC/nPXHhoKwO5E4IvcgqUyXXR8lE+dafFSTfyrS7y6ZUMnM40pcN8tpbT7UvncLaxxuQVsLANw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:06.1211
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6e7cc8-979d-4bec-fec8-08def6f228ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E80.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5720
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX3MTE86/09owF
 BPwY3xeoP95SpjmhRie9sMdDChdcpm3j9jhZrA7Ihi+XAOmpCgBDcer/jVGkMmIWeRGF5KB8vnf
 gPu7PDK6XyerkcFJJJUcPqveRSDKjpd0mWHbJENDpWFWSSfAOfzYFxN9FjZmknqfsnVgKaBbOlg
 kuqyG8UZwaSmO0ajxP3Ot6EgC7MyxK/xrfxMpOHysk2Qle1R1lSFWcOxuhFsug478Fp3yy7S5as
 XbaOrMhCix8vNOF0A5lbbvlOL9gb03WY9/zsWt87GDiXF2eAQuNqp5miq8wE2dpmwe8qPq62QP9
 KxhzDSDuPP31eo+jOukamDFaJexkM1cPui82EXqUcE0FbswMag9b8jJmsgpaZp48H6TAO7AqcLD
 eTa/mp/AtPqZC87HqrAEamg9Ne6rF+B8Rp+NHjnJKi7d9NS8HNI0FJmqvSOQqsDEHVWTn+/8Mm/
 6Y47MyMU6BEtomBsxgQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfXyBoBoWN8X82E
 gusYtTx/C7YFLs3ndTViIbcspKDeYrnuBAq99QF8+9YFUWiAv6n4FrwazYchA5YS499NYZKMJUZ
 3co36C/3mWZrVfrEkLZV8ypCZFUoPhI=
X-Proofpoint-GUID: dJCFfgF6RQ-1c_R6wleJsjtG4pxn853d
X-Proofpoint-ORIG-GUID: dJCFfgF6RQ-1c_R6wleJsjtG4pxn853d
X-Authority-Analysis: v=2.4 cv=F85nsKhN c=1 sm=1 tr=0 ts=6a79eb02 cx=c_pps
 a=TKURuYQIacZDyiG+Utq8vw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=8AirrxEcAAAA:8 a=sozttTNsAAAA:8 a=G_UKfOQgHLmTBcQ1_a4A:9
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

Introduce function pointers in the udma_dev structure to allow
variant-specific implementations for certain operations.
This prepares the driver for supporting multiple K3 UDMA variants,
such as UDMA v2, with minimal code duplication.

No functional changes intended in this commit.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-private.c | 10 ++++-
 drivers/dma/ti/k3-udma.c         | 66 ++++++++++++++++++--------------
 drivers/dma/ti/k3-udma.h         | 12 ++++++
 3 files changed, 57 insertions(+), 31 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-private.c b/drivers/dma/ti/k3-udma-private.c
index 624360423ef17..44c097fff5ee6 100644
--- a/drivers/dma/ti/k3-udma-private.c
+++ b/drivers/dma/ti/k3-udma-private.c
@@ -8,13 +8,19 @@
 
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_pair(ud, src_thread, dst_thread);
+	if (ud->psil_pair)
+		return ud->psil_pair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_pair);
 
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
-	return navss_psil_unpair(ud, src_thread, dst_thread);
+	if (ud->psil_unpair)
+		return ud->psil_unpair(ud, src_thread, dst_thread);
+
+	return 0;
 }
 EXPORT_SYMBOL(xudma_navss_psil_unpair);
 
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 40ba114ac81dd..c44a12157e65f 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -40,7 +40,7 @@ static const char * const mmr_names[] = {
 	[MMR_TCHANRT] = "tchanrt",
 };
 
-static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -50,8 +50,8 @@ static int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread)
 					      src_thread, dst_thread);
 }
 
-static int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-			     u32 dst_thread)
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
+		      u32 dst_thread)
 {
 	struct udma_tisci_rm *tisci_rm = &ud->tisci_rm;
 
@@ -329,7 +329,7 @@ static int udma_start(struct udma_chan *uc)
 	}
 
 	/* Make sure that we clear the teardown bit, if it is set */
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 
 	/* Push descriptors before we start the channel */
 	udma_start_desc(uc);
@@ -521,8 +521,8 @@ static void udma_check_tx_completion(struct work_struct *work)
 		if (uc->desc) {
 			struct udma_desc *d = uc->desc;
 
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 			break;
 		}
@@ -554,7 +554,7 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 		}
 
 		if (!uc->desc)
-			udma_start(uc);
+			uc->ud->start(uc);
 
 		goto out;
 	}
@@ -576,8 +576,8 @@ static irqreturn_t udma_ring_irq_handler(int irq, void *data)
 				vchan_cyclic_callback(&d->vd);
 			} else {
 				if (udma_is_desc_really_done(uc, d)) {
-					udma_decrement_byte_counters(uc, d->residue);
-					udma_start(uc);
+					uc->ud->decrement_byte_counters(uc, d->residue);
+					uc->ud->start(uc);
 					vchan_cookie_complete(&d->vd);
 				} else {
 					schedule_delayed_work(&uc->tx_drain.work,
@@ -612,8 +612,8 @@ static irqreturn_t udma_udma_irq_handler(int irq, void *data)
 			vchan_cyclic_callback(&d->vd);
 		} else {
 			/* TODO: figure out the real amount of data */
-			udma_decrement_byte_counters(uc, d->residue);
-			udma_start(uc);
+			uc->ud->decrement_byte_counters(uc, d->residue);
+			uc->ud->start(uc);
 			vchan_cookie_complete(&d->vd);
 		}
 	}
@@ -1654,7 +1654,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1663,7 +1663,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	}
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -1718,7 +1718,7 @@ static int udma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_ring = 0;
 	uc->irq_num_udma = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -1821,7 +1821,7 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -1849,8 +1849,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 		uc->use_dma_pool = true;
 	} else if (uc->config.dir != DMA_MEM_TO_MEM) {
 		/* PSI-L pairing */
-		ret = navss_psil_pair(ud, uc->config.src_thread,
-				      uc->config.dst_thread);
+		ret = ud->psil_pair(ud, uc->config.src_thread,
+				    uc->config.dst_thread);
 		if (ret) {
 			dev_err(ud->dev,
 				"PSI-L pairing failed: 0x%04x -> 0x%04x\n",
@@ -1910,8 +1910,8 @@ static int bcdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->irq_num_udma = 0;
 err_psi_free:
 	if (uc->psil_paired)
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	bcdma_free_bchan_resources(uc);
@@ -2014,7 +2014,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 
 	if (udma_is_chan_running(uc)) {
 		dev_warn(ud->dev, "chan%d: is running!\n", uc->id);
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		if (udma_is_chan_running(uc)) {
 			dev_err(ud->dev, "chan%d: won't stop!\n", uc->id);
 			ret = -EBUSY;
@@ -2037,7 +2037,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 	uc->use_dma_pool = true;
 
 	/* PSI-L pairing */
-	ret = navss_psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ret = ud->psil_pair(ud, uc->config.src_thread, uc->config.dst_thread);
 	if (ret) {
 		dev_err(ud->dev, "PSI-L pairing failed: 0x%04x -> 0x%04x\n",
 			uc->config.src_thread, uc->config.dst_thread);
@@ -2083,7 +2083,7 @@ static int pktdma_alloc_chan_resources(struct dma_chan *chan)
 err_irq_free:
 	uc->irq_num_ring = 0;
 err_psi_free:
-	navss_psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
+	ud->psil_unpair(ud, uc->config.src_thread, uc->config.dst_thread);
 	uc->psil_paired = false;
 err_res_free:
 	udma_free_tx_resources(uc);
@@ -2123,7 +2123,7 @@ static void udma_issue_pending(struct dma_chan *chan)
 		 */
 		if (!(uc->state == UDMA_CHAN_IS_TERMINATING &&
 		      udma_is_chan_running(uc)))
-			udma_start(uc);
+			uc->ud->start(uc);
 	}
 
 	spin_unlock_irqrestore(&uc->vc.lock, flags);
@@ -2265,7 +2265,7 @@ static int udma_terminate_all(struct dma_chan *chan)
 	spin_lock_irqsave(&uc->vc.lock, flags);
 
 	if (udma_is_chan_running(uc))
-		udma_stop(uc);
+		uc->ud->stop(uc);
 
 	if (uc->desc) {
 		uc->terminated_desc = uc->desc;
@@ -2297,11 +2297,11 @@ static void udma_synchronize(struct dma_chan *chan)
 			dev_warn(uc->ud->dev, "chan%d teardown timeout!\n",
 				 uc->id);
 			udma_dump_chan_stdata(uc);
-			udma_reset_chan(uc, true);
+			uc->ud->reset_chan(uc, true);
 		}
 	}
 
-	udma_reset_chan(uc, false);
+	uc->ud->reset_chan(uc, false);
 	if (udma_is_chan_running(uc))
 		dev_warn(uc->ud->dev, "chan%d refused to stop!\n", uc->id);
 
@@ -2355,7 +2355,7 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	udma_terminate_all(chan);
 	if (uc->terminated_desc) {
-		udma_reset_chan(uc, false);
+		ud->reset_chan(uc, false);
 		udma_reset_rings(uc);
 	}
 
@@ -2374,8 +2374,8 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 
 	/* Release PSI-L pairing */
 	if (uc->psil_paired) {
-		navss_psil_unpair(ud, uc->config.src_thread,
-				  uc->config.dst_thread);
+		ud->psil_unpair(ud, uc->config.src_thread,
+				uc->config.dst_thread);
 		uc->psil_paired = false;
 	}
 
@@ -3694,6 +3694,14 @@ static int udma_probe(struct platform_device *pdev)
 		ud->soc_data = soc->data;
 	}
 
+	// Setup function pointers
+	ud->start = udma_start;
+	ud->stop = udma_stop;
+	ud->reset_chan = udma_reset_chan;
+	ud->decrement_byte_counters = udma_decrement_byte_counters;
+	ud->psil_pair = navss_psil_pair;
+	ud->psil_unpair = navss_psil_unpair;
+
 	ret = udma_get_mmrs(pdev, ud);
 	if (ret)
 		return ret;
diff --git a/drivers/dma/ti/k3-udma.h b/drivers/dma/ti/k3-udma.h
index 767b73021390d..16de0b218d8ad 100644
--- a/drivers/dma/ti/k3-udma.h
+++ b/drivers/dma/ti/k3-udma.h
@@ -348,6 +348,15 @@ struct udma_dev {
 	u32 psil_base;
 	u32 atype;
 	u32 asel;
+
+	int (*start)(struct udma_chan *uc);
+	int (*stop)(struct udma_chan *uc);
+	int (*reset_chan)(struct udma_chan *uc, bool hard);
+	void (*decrement_byte_counters)(struct udma_chan *uc, u32 val);
+	int (*psil_pair)(struct udma_dev *ud, u32 src_thread,
+			 u32 dst_thread);
+	int (*psil_unpair)(struct udma_dev *ud, u32 src_thread,
+			   u32 dst_thread);
 };
 
 struct udma_desc {
@@ -618,6 +627,9 @@ int udma_push_to_ring(struct udma_chan *uc, int idx);
 int udma_pop_from_ring(struct udma_chan *uc, dma_addr_t *addr);
 void udma_reset_rings(struct udma_chan *uc);
 
+int navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+int navss_psil_unpair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
+
 /* Direct access to UDMA low lever resources for the glue layer */
 int xudma_navss_psil_pair(struct udma_dev *ud, u32 src_thread, u32 dst_thread);
 int xudma_navss_psil_unpair(struct udma_dev *ud, u32 src_thread,
-- 
2.54.0

