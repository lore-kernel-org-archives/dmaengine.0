Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0083C40B0F2;
	Mon, 10 Aug 2026 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374895; cv=fail; b=jLJzPPCIqrN2oZoHZFeBplhkwQX4pPCDPA6L2ph1TBFU0GZjcP/VAaVVTwicZs58oyyMlf0bXHulB8FjJ3bSbRoXxVHUqcDmcUAlBbW1tv/CRwIdZQdL4JYqJroyGpnrEu2l4HGorxjsLFsqGvUR6Dr6LR/6hLLMwkERlDXbUIU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374895; c=relaxed/simple;
	bh=CLWs30bM4rdb9SptEfdnX07cQImLdMRoX+quREV4Vv4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G6jCYS1fFQy/Y0Iv+GVOC2795tzOh0jnJ3Y2773XN5GGndl6x13lKWiHwtZMbzd+Z9mReWpC+QSiuWLAhysYxYKpMI9LBUN9tcyPpF6sdFcaTh6U5zMmYyi/tZ190SyeqebpNpK46B9S3S3ZFUZ57ewZrhL3Q4ReFlQlqAto85w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=C+3NhW9F; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qyYk4EJu; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="C+3NhW9F";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qyYk4EJu"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUcMR2888635;
	Mon, 10 Aug 2026 10:14:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EPWDEmvEVzUQf5oEGlvVWe6wtqyk8cbFBWHDBECuw
	LI=; b=C+3NhW9F6XRFzdytQWnn86zcSvCgYHbJp0sHnhu44pC8Jcd6zq61vjbNE
	J55lBGePU3SjYJ1rlP3talkld7W0rkgXsmJ/mntfdjz8YYSp/YIfjrx+tIfdOCFr
	MXuXb6i4opBfpxX96jeQ4zqp7wF5+sMFH21KaKvwNTg/Lj218OY31TNAyEDrBACN
	/XAO6U1n3GWDb+7VcJbElBviGwzyPh0X8aAMITEz8Iac5/YA8D870ReIsnPZMIob
	O4dstXDkRe3fKeMiCQWS/QgMoqR+Fa6+LNdmBhjT7tap/luPPEhovSPaS0i6hzjb
	GUSA5JUf7IN0LeWbklI5z/szDw9nA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011043.outbound.protection.outlook.com [52.101.62.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fydkmsgyy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:14:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRADSExy6lvdvFgnMbAx0NvpdlfiPddF7cUx/aiR3gA09IB6TQn9UROzdXpxDCREdO5V6ed01pG4TzbhopA2vRIbrH0rCIUeBRSPwwaanG3e0XhKA+f8M2RU5qda2HnrclMDcle2Ly+fnSyXBBR1raiW0bNINnfN/o3xHBeJaWRKNwxb5ID/95BaKNd/vuwYUZexTwmLP2H40EN3IxRH723+3T1f4ZZQilZWcq6iRs/q8JkdiOFixtld/9xtukBlewBQAb0J3W8FlJNuE2WKM0USwcPx5m/tMnY/Aw0dXD1KSOLiF5eD/MoUOX8W0eJPIwBfjAgU9dkAFxMD+16dDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPWDEmvEVzUQf5oEGlvVWe6wtqyk8cbFBWHDBECuwLI=;
 b=LEWN3CdGdWwJh73PpLfY7JQ9+VSaghJQZGUSfCtqIctiXsq40igAZiAsI2RINW8KfrzbOCdok3s4C2A+/TDq0HbjJA2B7RWV7DLiPh0clYvJ/wzIt3hj7FKfApCXBLzMVSQKBDhAzvrZSbPazQZbP8/qXM1iS6z2DUjtLfNToxmHRa+dE8UEcTOoqWIqsGLA9zOHBz8wGew3dcifVrhHE4OE2539JrBo/VOf0cmvlTSBABdGerPi7U7ehf/dHkEcv8vmQk3vkEADCUIXbvcK8C2EmandIsIvqOXZGVgBzzKUplzJZ3q4adNIlsOC6YT+CS+7N0u5prskf2OkfIx8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPWDEmvEVzUQf5oEGlvVWe6wtqyk8cbFBWHDBECuwLI=;
 b=qyYk4EJubfmgKuZQE0o8sooZbjfmdPIMATXRlhzlcoZSQdkHrfKjUKjxk7WD+vvSSRwDofhbBmnKR0O6mKZoZGOw1f3T98qBmuLjZBRdcMmsmMZKztkYJJauXvr1GjeVmQDUlwL2Dpl5YlQqGrdyNXzae6hpChtDTHM4JNtff20=
Received: from BY3PR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:217::21)
 by DS7PR10MB4958.namprd10.prod.outlook.com (2603:10b6:5:3a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:14:37 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::4) by BY3PR04CA0016.outlook.office365.com
 (2603:10b6:a03:217::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 15:14:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:14:37 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:36 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:14:36 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:14:36 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERVu2648613;
	Mon, 10 Aug 2026 10:14:32 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on AM62x
Date: Mon, 10 Aug 2026 20:43:55 +0530
Message-ID: <20260810151423.1948224-2-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|DS7PR10MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: c7297dce-19f2-4fec-e442-08def6f217cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|921020|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	8woG8sWgu4CYrrdJKZzV1mWAWFOFQEgmrX+bK7mDCEPdD5uTueojhrkeUleaP1k/YHnBxBja04BwdM5Sfa8CuOego6d3M4wMNQiEwpAz4V7CSRm2pz0XAFMzLQhMIOLRGr///pfDXebeIzjZyyFiMK3vPINumbXQBqE/8rXKKJordwIapP/7f7KOz4dJQ2qYuOuneWP+wdnqn4J3FkuA1TQhBLbQ49gY4kp+yZYHvrTaUOOffx69dug/yHaSMnG/aRy/4ZB9+i89Jryu3y0Gab5goqXwJb6C3YWZJWCPpyUdV8DsJ05E8Ii+n3SP+mKDatpkHvbFoQIe28nE58LfYCutGdM7HWD2MNMqcvauYBC1arqSKDNTJYk1cydrEUA4OFCWPdfNsivVRuP5EwoJP9et8+I5GcyP8upihHtqD1e9uwZKmaTe+f3+JmwHDF2E42a20AfIzF9asFOJ2RLjZQs9xE1ZPl67XE/8oPRRoRCtvwJJlHiRQnMyCSGfZIvtH45TRgeUTtxJMniALFFpVOCBFgC3Nbd8ECeXe3PB1rXYRtgKb61ZEPV3RQHEm+/RXVkF/N87piNJj321Deu4/5kD3tpCq8gDntNPlYW6YQkglNw1+WIpkaMWUX/ScBynss4/gYKVAhuz4tMVOyKHNcqp/Px1iD22lrjeZCou8GK5wl+Y+KXCPFwK6lWu4/B+pMBsx7QjLUaB/sdCTgKVdUOgUzEpTrZ8abgR8jj6kBKVhQK+Cnet+h4zDiKGzbo7
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(921020)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yFiZu7RkrUdpKL/jGSd2LUU4qIQlGA9U1Voy24icCtLk6OdB7lkfXjpUXS/Xn5imkrzTHVDkx53uwb98F14DI26ILsCIr0C3h7+9kP7bKSS+sBvMWNuue78I724gm1zPXT3loqqjMelAgS/+PZWEHoYZq1h3aOgQfem+vfHpjrVNaxHzH4du2zXssS3Z/SN02LJZuezuVNJebi9+mv08XJPniDS6E5nbSJ5g5PwhAM4D/pzpnKFwU4TtF3iFOGYjByP7UWIhjaRlRR2wff3eZwhIsyeLIKHHLkeDqnNi1TYqDysWX9Mw4kvZ8BiSA+mby5FUFkCgpxjwi0wS+7AFOgAJ5BIIUAokaZTzBTPBMN9c8ld3JQRfoCTOELEvWODUpcpKZW6dhP38bBjhKgUoDmbRwC/r6Gr7pXB4tFMo1yv4yHG9IfwPphu4fPpAXqN4
X-Exchange-RoutingPolicyChecked:
	m4/mqH/OCgpeor77fDkwKRHkLBQRtqSMzxYAzZmvr9A5OTavEkezHw2XqRcNYKobTxW2pVXuHE8NNLKg/eTs3hgKoSiiwZdW/1qSBgGOuqNSiZtehVxn48aIsxOe7M+x+6m9JMHs2HtS8Bc1bEg18rUVLNsNPJrUljHJV+O+bEALCqDwM45AU8CzYrkp+6/hTyrUdtk/mYFNK6K80qSVK+XkhM6/uadcsyt4xNS9mJ6VxTN5DrySgMCE6HzfWfQMO9VUjXdwAS0kc11poQ7BnmQVvjJlD2yOrZvoB9l9sH90AjM9AHPNYFo5f9gt2nM0Kjk51BR4vYLyXT+KlUKWJA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:14:37.3566
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7297dce-19f2-4fec-e442-08def6f217cb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4958
X-Proofpoint-GUID: orz7Je3FbCoEb4qJTYZHwxJedogRtfC5
X-Proofpoint-ORIG-GUID: orz7Je3FbCoEb4qJTYZHwxJedogRtfC5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfXyG7NlBJjJ35c
 zeW6ohkwWtgaXtibu4j0hnUV7FPMEFSSy8OR75MgCaiptj4U6xxhAG8V73OYosm3HCl/PyHwB2f
 WuyoUzeRIaGzIu669D9plFdIhBSS60bqe5ILE4NwcW6Wg7xc4/QdTF5F1e1LZDQu1PWmPeNOVx2
 NRHI1T2CIKzh1vGSQoU/L+QMz3/qliOFGx4N9PhjNl7L46fb6CtgRSWPJZjH5cMp5JQOpky7mMA
 fQbuXr/aPqqdHLrLOUzAmf2mebc95wI+yd8TAB9YVrCfegWqgIOIY4jSxP8nLlXgCJd8jm62zmc
 BySDaMGIeUb84mKetcE+ifC5EL6Q8CqsRYUx3XTRYmCdt6Nyvf9Nc/Bd1IsqCjBXSFvcyY9WTrt
 84KUOeE41V5r7rFT/ffVny9dlEXGQALe0pfDRkVYuMPokgIWICLAGBlRraxUrWUJ4zGI/+Awecp
 t1d/RoNoZOTJur42JUw==
X-Authority-Analysis: v=2.4 cv=Ms1iLWae c=1 sm=1 tr=0 ts=6a79eae0 cx=c_pps
 a=mKNYdAcvaxCE01og5pBKbQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=YS4YLeW4SzYDQNh2yKMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX06+Sa9No+V6P
 4017dgynJQjMY+FsxmejQwuh23ICxCr5kh4nRVA7IvTejryk5UOk8kAaT8gWywqeAQi6k3apUt3
 A99BGvueNJ4VuYyB/geOzQG2x02ubPI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 adultscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100131

From: Vignesh Raghavendra <vigneshr@ti.com>

ring_init_data is declared on stack and thus can contain garbage which
can lead to k3_ringacc_dmarings use junk address for ringrt base leading
to below crash during ring pop

[    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
[    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
[    2.540051] Mem abort info:
[...]
[    2.629987] Workqueue: events_unbound deferred_probe_work_func
[    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
[    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
[...]
[    2.726250] Call trace:
[    2.728691]  k3_ringacc_ring_pop+0x48/0x94
[    2.732786]  udma_ring_irq_handler+0x34/0x218
[    2.737141]  __handle_irq_event_percpu+0x60/0x14c
[    2.741846]  handle_irq_event+0x4c/0xa8

Fix this by explicitly initializing the variable to 0.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/dma/ti/k3-udma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index fb21e0df5ab7b..48f4db777d924 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
 	if (ud->match_data->type == DMA_TYPE_UDMA) {
 		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
 	} else {
-		struct k3_ringacc_init_data ring_init_data;
+		struct k3_ringacc_init_data ring_init_data = { 0 };
 
 		ring_init_data.tisci = ud->tisci_rm.tisci;
 		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
-- 
2.54.0

