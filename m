Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2B426416;
	Fri, 24 Jul 2026 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888590; cv=fail; b=M1iuemMnSlmfLJ6w5w1rMwJiwvTM1hIAWEwB4cnXa6y4f3IJocy1How2R1UKX0b3jgX+zvfgLmoDMGnHc9pXhKZkO+0ELuGPNMvT80pw2JIleGHyRtbYkCaPHyJIgGwN9xnqzkVhNaOnWqTJ5pBqIkAqE3Kidhoaxvx9hVRgdCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888590; c=relaxed/simple;
	bh=itB6MkycUtMADRSZCIKkEkECzV5nURYe1QutKWaXjgY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IS4YzerqXV23YmrEknVGrG6PaOjlc4W3boHJhLB4MAYbzl0972dlkBpg/7jL1aH+BY+RzKIcMSB4yVGshR2KY919hJ6LuLc1faURjnpiFfV1AmCDEo5Ky0FHLEyhO9rDT1jkbuwRWul5gM9Vwv+vH5g+SsojPA8ywZoZprvfKQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dInbBnhR; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ipvxAEHi; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dInbBnhR";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ipvxAEHi"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAFcnj785578;
	Fri, 24 Jul 2026 05:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=RafoSg/rRS0ocxqA8msW6b042DQTCrc9ZzCU7RQU4
	E4=; b=dInbBnhRU0YHY1z8B0zXwUi5dLJu2BZOpWCIFAMs3uclPciKMYpMRmZ7b
	xixjflw+qSfq3oJJjCPQzSYdQUe09iAhdv/lhUIe2H5BswdEDEAPl7EnPhgSYXfh
	cAftu+5/Dc5BY0hjUVhsZrGieulK6CuT/oAD0Dtv2Ty4e8/Ach/gTE9tIMAmk/v9
	35QFjWJ+bHzc06/nQImZFPIx+SQhWqs1wGgiw6O/T5df7ExYzInWwbKanvILGgW2
	kAZ/zjwjI7o6uD3S3v6k81U3e9EnVhJucI+HJPshte/nhRIwDLTyUdYswaCYxtP3
	UNeVtkHzbRjTJfDE7ATmvk5j/bV9Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013053.outbound.protection.outlook.com [40.93.196.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fm5p304ns-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 05:22:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fg1B7DliHfjkfNvlBKuR+yWC2ys7cGl1XyS7yp7Zuc1St5mf7MGI/A8bgQouQP5IgM2Ql1QfZHdzJq+8UjUiLYNlsAHNp4yuODBRLehrsTgsyNroj2m1g2rt7+evNsP4rUQ74vCq7KO794bQx/J+BsMbrLHE/jbO5KxxdJ++noGQ9CxxnegCevzVC03H5OUCI6946/dR+TTA7VyhwxKcGNjpZKFGI7zUiJC9YgTF8zlFQqt9GvlXYLyQlms1XTd6GJUSjOmLxL4tRMZCeSFSlfEE0CqO0i1Y9lp6n5x1mUwZzSejN9bVvxkwvfY55V7Eig3o0rFQZ3GKNDMWqSmZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RafoSg/rRS0ocxqA8msW6b042DQTCrc9ZzCU7RQU4E4=;
 b=KJbzkKN0WZl/WaY65Y85IDRpOouFGDopEABRTngDX2CZqv9M8+iRjnd9xddQvu6fLCodr6eSn/FdqK9MBDkKrgCxsnFv9EGzIoOolMyRJ9dEwJZB7y+xVh1mJ5eT8+2Hu261LjmwlyMDNk6t1IUf5qIo8Owo84T09HEkNbeiyVRRa+cGoBysv+2I++nOEaRPZUMlnQnbnkBlIKuFqVb5e1lgntetczxBCCJE9oLayA4osUya70PMAnPpP/6etJbM1pRgwyAq6SUXQHSfmq4WuPSros3OMDpcmtvdCEIm+JBvA0FnLY2Jg6W8Of3IN2rKrXb3hJdxTQfdXsssBn/Pkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RafoSg/rRS0ocxqA8msW6b042DQTCrc9ZzCU7RQU4E4=;
 b=ipvxAEHiVcoO5OPtrGJWpYnwtAUXgHEpkexFaGnCUS37LONNBbNkEvHdadmT8lTNavBdD3NWagOHkUBc8U8p7iXnR7vGrCfYhE0Zal++UthbB0Fzq64M6CXGruG590EbCdiT+JUmhoH3pbltnOiDTnr+7Gek3LzeIRG8R8WgEWs=
Received: from SJ0PR05CA0175.namprd05.prod.outlook.com (2603:10b6:a03:339::30)
 by LV3PR10MB8131.namprd10.prod.outlook.com (2603:10b6:408:27f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 10:22:48 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::65) by SJ0PR05CA0175.outlook.office365.com
 (2603:10b6:a03:339::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Fri,
 24 Jul 2026 10:22:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Fri, 24 Jul 2026 10:22:46 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:45 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 24 Jul
 2026 05:22:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 24 Jul 2026 05:22:45 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66OALMFU3017088;
	Fri, 24 Jul 2026 05:22:40 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vkoul@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nm@ti.com>,
        <ssantosh@kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <vigneshr@ti.com>,
        <Frank.li@nxp.com>, <s-adivi@ti.com>
CC: <r-sharma3@ti.com>, <gehariprasath@ti.com>
Subject: [PATCH v7 15/19] dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
Date: Fri, 24 Jul 2026 15:50:48 +0530
Message-ID: <20260724102115.2854-16-s-adivi@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724102115.2854-1-s-adivi@ti.com>
References: <20260724102115.2854-1-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|LV3PR10MB8131:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e2f886-1de6-46d1-0705-08dee96d8185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700016|23010399003|1800799024|3023799007|13003099007|56012099006|18002099003|22082099003|921020|10067099003;
X-Microsoft-Antispam-Message-Info:
	2ctnBaq3nF72dDJ42chekD0ZllQoj98vZO1fw47I2bW43KKPt9j2gunkvwaxcWy3KsQplTifFV8o7KR8LuTpjWesjGTmDKberYZ5wO5GblGKE9QagFp2r9wxHbY10D2ZW4n+v6v29XD1j2GF8f4+FKmntrLv1ruUmwHnh/RMBUGMrkeQOq61Jx7B6otGQ7NO+rZspumO28W20pJ+RNf3N8dUYf6wqG1qJryrz3i0aH5ncBF4YoKn+Bbslj++L//v4LygcL8Tn7u8ntsuNcMBmDR+8jUyQadfk4V5I4/49cywbqS3Qr0baXvXI9JCd+UQ2n2UsV9CSGV1m6YuDdd4MOsHGDw3rBKov5SFOp6RqaewGJlOuBGh8iZ1K2flXZzU0SLpY6KPuwug4PUPQV+K3VrEJkdaJ3Ewd+MmThmpGe2EcyGbMnpqmZlyDv29z7VVltipviI+rlxK5Ev8Bhl10/Pvd4QrXM4VZ+uyoAo2/2xbyycct0Po4aQlkcqo3rcIsSjnLeu5I2pAuCI8fZtZNPn6WVTqKMBVFMMvRcPj5sRps4eOyX9TPDiV0sYm9Zk47x0YWXxiFC5GuTB7kObcnJXUqY88wTWuzrCL2dsHhBbP/nvS+L4bK2M2djJjUkyYfTCyHXIgjtbcr0yjhop774mpxX5guhUTMc8hDQDklbS/TUTL+7yKkMaOwq1q/ogH
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(3023799007)(13003099007)(56012099006)(18002099003)(22082099003)(921020)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OkMhC8347EV3dKSynmTdR7J1lLKyRPkhA6NHLtooTUMwHtc+1xPCIj9GAE00T7fFvgvqpE+8AvK/eNqdsTMzWrMOvTLOcR0TZMomZVTZryxUqRhcs4OV+Lwn/KHn0vIiiI0ds5hLgAmWSIQ7kXy1xjvyhU9sG6FKQ5mlMbfEAVwUyW+vdKo1ZD0OTirJPgoVp5/sUTKpSJ8sZCVdmbMfDFIAhuRpyryR8j2ZvXPvu/4utEKdyZ1BMfMMwkWRVPK20CkkZmr6Lbzb4lE03pjgpjKmhN16vWsLbdUXlzmQ/jxfFR4Ul2UlE3UyAtqaEvnzaV9b8JcQ0gPA7aLtKOzRg2Gb5LwnWBcVFhGM4gHTBbwgU4sQ2GkU2kiDd31DEEBKMts8A/xyRBS7Yu+veAaojOmBJcyd0UM4wFSEwW/m4+M+SeMkXf5IoDxH+C0q/uXH
X-Exchange-RoutingPolicyChecked:
	VdhNvD2lH5E17gNeQTvwJ8zdVnhONekwzwXKW6X4YzeNUQFhkUl+2pLY8SGS4I+sxMeqU1aPmI3+iAgAoOgKWtzRDAwcGq0bduSgsMGMJCTL8AMHII7YOLcV7u3esWO0Vy1sSU7BkNlGQ+gFOpyMmAu7RTFiJID0iIEq/hQc5oE5mGwlZ5RSb4yMPyUhinspkp5pU7H8zoXDiX6gVvBJxRH/z+Gf7kTj/AgaMMSGzZMTy/3417WqoAxFhtghbb0yv0xMEOzePku9bF9FseWLhgblczh2clFbmS1THHODAkKDC5zxn5xRkGZOu48EuaeavYSb8TkZYrX2HRLFu9n9GQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 10:22:46.5528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e2f886-1de6-46d1-0705-08dee96d8185
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB8131
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfX+Xg71UzYSTcj
 ijAPKpdUHbm8ooDyePVyClgrOA7CSW6YLYKASY+oFKCBZ8/rFrbb4tMU/OvrScD+TGI9IuoMWOe
 DsKhPT+oiBkYpS4Cke88ht4SV7/3QMRWpNj809/bYEUjA1QuXy0slhqdAl55iIak4+EC4u+F2s2
 mluBCHGvbCskcKIkmhSFlwTM4DuYDKp3w3FvEi7DJS4xgN2TWGNb+A7H1sAYIGkitmuvggIE/yT
 OXqcA/1ODA2FBwp+5LoJHrubBRshW7bQkrHbUZIir/0uic9GUhVZIhxdVMpkIImp7wBjHU7Lm5V
 tj6A5jkgxG2QmqZhdgIO/hvbqu/+t/hShPg1J7art02Wdk2fwGyxZfyoml3dGiE+EVXFQ5Q5bVm
 9FOGtv6wPHSyZCS8XWB/e7LzG4V5eTcbFm7PGTW9hBbexEarF+BIvNG1cgb1dowQWOOI9iJ6phJ
 Nd9cBAGbjzisT9z58mA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NCBTYWx0ZWRfXw3G7kG1BU/9j
 nEMsKVux42lYEkKmkvuOMcBlOCozxzEbzwhV5u77yHS52dHa8r7RsVwLehoQOLtKm+zq2ttqxHn
 Fdko2m8JDRmLDkSKzVUSvkVG2QqmjNs=
X-Proofpoint-GUID: 5r_t8SQnR_grftmVne5gvRo9wejK0S1_
X-Proofpoint-ORIG-GUID: 5r_t8SQnR_grftmVne5gvRo9wejK0S1_
X-Authority-Analysis: v=2.4 cv=C8PZDwP+ c=1 sm=1 tr=0 ts=6a633cfd cx=c_pps
 a=5zjvB78PlnLPEzvzEo0MXg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=SxTibnW5tSAW0Is98DsA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240094

Add PSIL and PDMA data for AM62Lx SoC.

Introduce new PSIL_EP_PDMA_XYMF type for channels that have multiple
selectable fifos. Also add a new fifo_id field to psil_endpoint_config
to specify the selectable fifo_id.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/Makefile        |   3 +-
 drivers/dma/ti/k3-psil-am62l.c | 169 +++++++++++++++++++++++++++++++++
 drivers/dma/ti/k3-psil-priv.h  |   5 +
 drivers/dma/ti/k3-psil.c       |  71 +++++++++++++-
 include/linux/dma/k3-psil.h    |   3 +
 5 files changed, 247 insertions(+), 4 deletions(-)
 create mode 100644 drivers/dma/ti/k3-psil-am62l.c

diff --git a/drivers/dma/ti/Makefile b/drivers/dma/ti/Makefile
index 3b91c02e55eaf..41bfba944dc6c 100644
--- a/drivers/dma/ti/Makefile
+++ b/drivers/dma/ti/Makefile
@@ -14,6 +14,7 @@ k3-psil-lib-objs := k3-psil.o \
 		    k3-psil-am62.o \
 		    k3-psil-am62a.o \
 		    k3-psil-j784s4.o \
-		    k3-psil-am62p.o
+		    k3-psil-am62p.o \
+		    k3-psil-am62l.o
 obj-$(CONFIG_TI_K3_PSIL) += k3-psil-lib.o
 obj-$(CONFIG_TI_DMA_CROSSBAR) += dma-crossbar.o
diff --git a/drivers/dma/ti/k3-psil-am62l.c b/drivers/dma/ti/k3-psil-am62l.c
new file mode 100644
index 0000000000000..ee77fae3787a4
--- /dev/null
+++ b/drivers/dma/ti/k3-psil-am62l.c
@@ -0,0 +1,169 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2024-2025 Texas Instruments Incorporated - https://www.ti.com
+ */
+
+#include <linux/kernel.h>
+
+#include "k3-psil-priv.h"
+
+#define PSIL_PDMA_XY_TR(x, ch)					\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XY,		\
+			.mapped_channel_id = ch,		\
+			.default_flow_id = -1,			\
+		},						\
+	}
+
+#define PSIL_PDMA_XYMF_TR(x, ch, fifo)				\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XYMF,		\
+			.mapped_channel_id = ch,		\
+			.default_flow_id = -1,			\
+			.fifo_id = fifo,			\
+		},						\
+	}
+
+#define PSIL_PDMA_XY_PKT(x, ch)					\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_PDMA_XY,		\
+			.mapped_channel_id = ch,		\
+			.pkt_mode = 1,				\
+			.default_flow_id = -1			\
+		},						\
+	}
+
+#define PSIL_ETHERNET(x, ch, flow_base, flow_cnt)		\
+	{							\
+		.thread_id = x,					\
+		.ep_config = {					\
+			.ep_type = PSIL_EP_NATIVE,		\
+			.pkt_mode = 1,				\
+			.needs_epib = 1,			\
+			.psd_size = 16,				\
+			.mapped_channel_id = ch,		\
+			.flow_start = flow_base,		\
+			.flow_num = flow_cnt,			\
+			.default_flow_id = flow_base,		\
+		},						\
+	}
+
+#define PSIL_PDMA_MCASP(x, ch)				\
+	{						\
+		.thread_id = x,				\
+		.ep_config = {				\
+			.ep_type = PSIL_EP_PDMA_XY,	\
+			.pdma_acc32 = 1,		\
+			.pdma_burst = 1,		\
+			.mapped_channel_id = ch,	\
+			.default_flow_id = -1		\
+		},					\
+	}
+
+/* PSI-L source thread IDs, used for RX (DMA_DEV_TO_MEM) */
+static struct psil_ep am62l_src_ep_map[] = {
+	/* PDMA_MAIN1 - UART0-6 */
+	PSIL_PDMA_XY_PKT(0x4400, 0),
+	PSIL_PDMA_XY_PKT(0x4401, 2),
+	PSIL_PDMA_XY_PKT(0x4402, 4),
+	PSIL_PDMA_XY_PKT(0x4403, 6),
+	PSIL_PDMA_XY_PKT(0x4404, 8),
+	PSIL_PDMA_XY_PKT(0x4405, 10),
+	PSIL_PDMA_XY_PKT(0x4406, 12),
+	/* PDMA_MAIN0 - SPI0 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4300, 16, 0),
+	PSIL_PDMA_XYMF_TR(0x4300, 18, 1),
+	PSIL_PDMA_XYMF_TR(0x4300, 20, 2),
+	PSIL_PDMA_XYMF_TR(0x4300, 22, 3),
+	/* PDMA_MAIN0 - SPI1 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4301, 24, 0),
+	PSIL_PDMA_XYMF_TR(0x4301, 26, 1),
+	PSIL_PDMA_XYMF_TR(0x4301, 28, 2),
+	PSIL_PDMA_XYMF_TR(0x4301, 30, 3),
+	/* PDMA_MAIN0 - SPI2 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4302, 32, 0),
+	PSIL_PDMA_XYMF_TR(0x4302, 34, 1),
+	PSIL_PDMA_XYMF_TR(0x4302, 36, 2),
+	PSIL_PDMA_XYMF_TR(0x4302, 38, 3),
+	/* PDMA_MAIN0 - SPI3 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0x4303, 40, 0),
+	PSIL_PDMA_XYMF_TR(0x4303, 42, 1),
+	PSIL_PDMA_XYMF_TR(0x4303, 44, 2),
+	PSIL_PDMA_XYMF_TR(0x4303, 46, 3),
+	/* PDMA_MAIN2 - MCASP0-2 */
+	PSIL_PDMA_MCASP(0x4500, 48),
+	PSIL_PDMA_MCASP(0x4501, 50),
+	PSIL_PDMA_MCASP(0x4502, 52),
+	/* PDMA_MAIN0 - AES */
+	PSIL_PDMA_XY_TR(0x4700, 65),
+	/* PDMA_MAIN0 - ADC */
+	PSIL_PDMA_XY_TR(0x4503, 80),
+	PSIL_PDMA_XY_TR(0x4504, 81),
+	PSIL_ETHERNET(0x4600, 96, 96, 16),
+};
+
+/* PSI-L destination thread IDs, used for TX (DMA_MEM_TO_DEV) */
+static struct psil_ep am62l_dst_ep_map[] = {
+	/* PDMA_MAIN1 - UART0-6 */
+	PSIL_PDMA_XY_PKT(0xC400, 1),
+	PSIL_PDMA_XY_PKT(0xC401, 3),
+	PSIL_PDMA_XY_PKT(0xC402, 5),
+	PSIL_PDMA_XY_PKT(0xC403, 7),
+	PSIL_PDMA_XY_PKT(0xC404, 9),
+	PSIL_PDMA_XY_PKT(0xC405, 11),
+	PSIL_PDMA_XY_PKT(0xC406, 13),
+	/* PDMA_MAIN0 - SPI0 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC300, 17, 0),
+	PSIL_PDMA_XYMF_TR(0xC300, 19, 1),
+	PSIL_PDMA_XYMF_TR(0xC300, 21, 2),
+	PSIL_PDMA_XYMF_TR(0xC300, 23, 3),
+	/* PDMA_MAIN0 - SPI1 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC301, 25, 0),
+	PSIL_PDMA_XYMF_TR(0xC301, 27, 1),
+	PSIL_PDMA_XYMF_TR(0xC301, 29, 2),
+	PSIL_PDMA_XYMF_TR(0xC301, 31, 3),
+	/* PDMA_MAIN0 - SPI2 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC302, 33, 0),
+	PSIL_PDMA_XYMF_TR(0xC302, 35, 1),
+	PSIL_PDMA_XYMF_TR(0xC302, 37, 2),
+	PSIL_PDMA_XYMF_TR(0xC302, 39, 3),
+	/* PDMA_MAIN0 - SPI3 - CH0-3 */
+	PSIL_PDMA_XYMF_TR(0xC303, 41, 0),
+	PSIL_PDMA_XYMF_TR(0xC303, 43, 1),
+	PSIL_PDMA_XYMF_TR(0xC303, 45, 2),
+	PSIL_PDMA_XYMF_TR(0xC303, 47, 3),
+	/* PDMA_MAIN2 - MCASP0-2 */
+	PSIL_PDMA_MCASP(0xC500, 49),
+	PSIL_PDMA_MCASP(0xC501, 51),
+	PSIL_PDMA_MCASP(0xC502, 53),
+	/* PDMA_MAIN0 - SHA */
+	PSIL_PDMA_XY_TR(0xC700, 64),
+	/* PDMA_MAIN0 - AES */
+	PSIL_PDMA_XY_TR(0xC701, 66),
+	/* PDMA_MAIN0 - CRC32 - CH0-1 */
+	PSIL_PDMA_XYMF_TR(0xC702, 67, 0),
+	PSIL_PDMA_XYMF_TR(0xC702, 68, 1),
+	/* CPSW3G */
+	PSIL_ETHERNET(0xc600, 64, 64, 2),
+	PSIL_ETHERNET(0xc601, 66, 66, 2),
+	PSIL_ETHERNET(0xc602, 68, 68, 2),
+	PSIL_ETHERNET(0xc603, 70, 70, 2),
+	PSIL_ETHERNET(0xc604, 72, 72, 2),
+	PSIL_ETHERNET(0xc605, 74, 74, 2),
+	PSIL_ETHERNET(0xc606, 76, 76, 2),
+	PSIL_ETHERNET(0xc607, 78, 78, 2),
+};
+
+struct psil_ep_map am62l_ep_map = {
+	.name = "am62l",
+	.src = am62l_src_ep_map,
+	.src_count = ARRAY_SIZE(am62l_src_ep_map),
+	.dst = am62l_dst_ep_map,
+	.dst_count = ARRAY_SIZE(am62l_dst_ep_map),
+};
diff --git a/drivers/dma/ti/k3-psil-priv.h b/drivers/dma/ti/k3-psil-priv.h
index a577be97e3447..970afd46a79e6 100644
--- a/drivers/dma/ti/k3-psil-priv.h
+++ b/drivers/dma/ti/k3-psil-priv.h
@@ -35,6 +35,10 @@ struct psil_ep_map {
 };
 
 struct psil_endpoint_config *psil_get_ep_config(u32 thread_id);
+struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
+						      bool is_pktdma,
+						      u32 *thread_id,
+						      bool *dev_to_mem);
 
 /* SoC PSI-L endpoint maps */
 extern struct psil_ep_map am654_ep_map;
@@ -46,5 +50,6 @@ extern struct psil_ep_map am62_ep_map;
 extern struct psil_ep_map am62a_ep_map;
 extern struct psil_ep_map j784s4_ep_map;
 extern struct psil_ep_map am62p_ep_map;
+extern struct psil_ep_map am62l_ep_map;
 
 #endif /* K3_PSIL_PRIV_H_ */
diff --git a/drivers/dma/ti/k3-psil.c b/drivers/dma/ti/k3-psil.c
index c4b6f0df46861..ed9c92d5a7b2b 100644
--- a/drivers/dma/ti/k3-psil.c
+++ b/drivers/dma/ti/k3-psil.c
@@ -28,6 +28,7 @@ static const struct soc_device_attribute k3_soc_devices[] = {
 	{ .family = "J784S4", .data = &j784s4_ep_map },
 	{ .family = "AM62PX", .data = &am62p_ep_map },
 	{ .family = "J722S", .data = &am62p_ep_map },
+	{ .family = "AM62LX", .data = &am62l_ep_map },
 	{ /* sentinel */ }
 };
 
@@ -71,6 +72,57 @@ struct psil_endpoint_config *psil_get_ep_config(u32 thread_id)
 }
 EXPORT_SYMBOL_GPL(psil_get_ep_config);
 
+struct psil_endpoint_config *psil_get_ep_config_by_id(u32 channel_id,
+						       bool is_pktdma,
+						       u32 *thread_id,
+						       bool *dev_to_mem)
+{
+	int i;
+
+	mutex_lock(&ep_map_mutex);
+	if (!soc_ep_map) {
+		const struct soc_device_attribute *soc;
+
+		soc = soc_device_match(k3_soc_devices);
+		if (soc)
+			soc_ep_map = soc->data;
+	}
+
+	if (soc_ep_map->src) {
+		for (i = 0; i < soc_ep_map->src_count; i++) {
+			struct psil_ep *ep = &soc_ep_map->src[i];
+
+			if (ep->ep_config.mapped_channel_id != (s16)channel_id)
+				continue;
+			if ((bool)ep->ep_config.pkt_mode != is_pktdma)
+				continue;
+			*thread_id = ep->thread_id;
+			*dev_to_mem = true;
+			mutex_unlock(&ep_map_mutex);
+			return &ep->ep_config;
+		}
+	}
+
+	if (soc_ep_map->dst) {
+		for (i = 0; i < soc_ep_map->dst_count; i++) {
+			struct psil_ep *ep = &soc_ep_map->dst[i];
+
+			if (ep->ep_config.mapped_channel_id != (s16)channel_id)
+				continue;
+			if ((bool)ep->ep_config.pkt_mode != is_pktdma)
+				continue;
+			*thread_id = ep->thread_id;
+			*dev_to_mem = false;
+			mutex_unlock(&ep_map_mutex);
+			return &ep->ep_config;
+		}
+	}
+
+	mutex_unlock(&ep_map_mutex);
+	return ERR_PTR(-ENOENT);
+}
+EXPORT_SYMBOL_GPL(psil_get_ep_config_by_id);
+
 int psil_set_new_ep_config(struct device *dev, const char *name,
 			   struct psil_endpoint_config *ep_config)
 {
@@ -90,9 +142,22 @@ int psil_set_new_ep_config(struct device *dev, const char *name,
 				       index, &dma_spec))
 		return -ENOENT;
 
-	thread_id = dma_spec.args[0];
-
-	dst_ep_config = psil_get_ep_config(thread_id);
+	if (of_device_is_compatible(dev->of_node, "ti,am62l-dmss-pktdma")) {
+		bool dev_to_mem;
+
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[0],
+							  true,
+							  &thread_id, &dev_to_mem);
+	} else if (of_device_is_compatible(dev->of_node, "ti,am62l-dmss-bcdma")) {
+		bool dev_to_mem;
+
+		dst_ep_config = psil_get_ep_config_by_id(dma_spec.args[0],
+							  false,
+							  &thread_id, &dev_to_mem);
+	} else {
+		thread_id = dma_spec.args[0];
+		dst_ep_config = psil_get_ep_config(thread_id);
+	}
 	if (IS_ERR(dst_ep_config)) {
 		pr_err("PSIL: thread ID 0x%04x not defined in map\n",
 		       thread_id);
diff --git a/include/linux/dma/k3-psil.h b/include/linux/dma/k3-psil.h
index 5f106d852f1cf..36e347311f8b2 100644
--- a/include/linux/dma/k3-psil.h
+++ b/include/linux/dma/k3-psil.h
@@ -35,6 +35,7 @@ enum udma_tp_level {
 enum psil_endpoint_type {
 	PSIL_EP_NATIVE = 0,
 	PSIL_EP_PDMA_XY,
+	PSIL_EP_PDMA_XYMF,
 	PSIL_EP_PDMA_MCAN,
 	PSIL_EP_PDMA_AASRC,
 };
@@ -78,6 +79,8 @@ struct psil_endpoint_config {
 	u16 flow_start;
 	u16 flow_num;
 	s16 default_flow_id;
+	/* XYMF FIFO index (0-3 for CS0-CS3), Only for PSIL_EP_PDMA_XYMF */
+	u8 fifo_id;
 };
 
 int psil_set_new_ep_config(struct device *dev, const char *name,
-- 
2.54.0

