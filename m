Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D10B41A519;
	Mon, 10 Aug 2026 15:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786374969; cv=fail; b=qQjNQRelKZJJ0NJmQHFK7Y6pc//M/YAVhsw0g1NvEd4j6FnF+eyFlXolI4QX77gGPbLQS31uSBZOqR/PdSwgZn5Ffa4IJOa6MNpW5M/4PWcsc2WK6Go08A1obd1Gx/7SgiQd0uXZb3s+qwF77rmOjwulb5yUcyTxOBiUnGxJh9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786374969; c=relaxed/simple;
	bh=W2c64I0TVEAKsm512vl2Zq9UJND4n/44wwNhNIhXcgI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxzjoLxRvVceVJsKPh+8Q+RTeYlVaPdbaw9mK/VjTA5x7g6taIoyE3Zmhmnn+dC4P/IyTL3gH5MxQfiJ39Z6mkCvnP0re1v+9CWYriwvtedMner8cbTHOA8goqwlkw9sdeEEd+yUBYO/fXUrWDG9lU1a405MWDeBH9cskPoiOMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Ol/OQOXB; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=suh1aDwU; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Ol/OQOXB";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="suh1aDwU"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AEUalV3239402;
	Mon, 10 Aug 2026 10:15:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=583WczV5Y4VXZsDXt8WnjDqVFwZUKE/vz+qd6kV/O
	uU=; b=Ol/OQOXBFKTkL8+B3Rpge7OnjDmHRI/v467OjGTozX4FJXif6W8hNamRR
	bEMVryPsS5jjRcz/61HY+gdaWBzUzRejG+ELS5s7/dOt7Zc6rqpwlDw3GAfZnXBU
	yKniSR8QN1hw5xhj1syWoSeIovt3asvbVIv8eZ+AcjH4yRQNzPJ6Q4kVj8ym8jU2
	gZV5qVw5wjXUbHizHGzqLDPIhPFvSbvRjTYgbpGZK9D7KIYNw1ThHpYaMJ/t4ois
	qW+zP3d8IgWSn1MLdT6i8+MD3ow6Poar2Nf6ua5HP4uAWcfrryvPyYrrydebpVfQ
	mcriitE7vA0DWINvl/FcDulrly5IA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011050.outbound.protection.outlook.com [52.101.52.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fxku6fp60-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 10:15:57 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKWWFy2oEzpcYMSXeLQ0YInFJx6jgVxuD4gjtbhqlAB8iP4I3ExSjHEi/BdwmqegDqbKoDu4yOi5dnvWSZ9J785eYjcKkSVjtW0B5Q8jZYTqHyKUAntneNAD+sKYiKWzkbOO7DHEIOh6v1xaay7pKqW3ZaYihNdOVUULEywR9EB1D8FVlgvzLJi5KOJOKxwGRLXgA2erBvSQBU4VbZC3IUynOtN0RBJJZWNIB3275a2JVuBD4+2RYneDYaz1/iVHhTGTfXEI02uMlm6nW3QbRrmWBH4Z6sd5wDXEpDx7pl8iMKISZMGnFIqrLDk3A8UFtwab6QfJHlSb6ln8ilnRoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=583WczV5Y4VXZsDXt8WnjDqVFwZUKE/vz+qd6kV/OuU=;
 b=BZjv9Q3ur3+Fm42bR2lncuU7dC1llpWwh5jyPGkjRRLMWEUt0Efbs41D5GJvWkTxvZeS0JLW836Kwmr/lltHJ/uqp5g4Nys/DXgKbtKDKejp//iKIc4rEckHI5uqk1bJdE0q3N3MDpGGaSnp2WAGWzTJUFJQrDSqDRf7Rp9ux2ym2I64t+zFsjw3OXAQWMWqi7J1eZMkNT7ucP4Il4DrCDUaFVfgcPz6IikcX1z7oq+fjr5aokd/gQcSRUYeO/A6l2Hd8XL5yM3IL/wNIoZU4fJMgly9g6nZIp3/ehhCKjKICQjrwt07Vngo9XAC194if54pcdMOsAih7tyMmb7QXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=583WczV5Y4VXZsDXt8WnjDqVFwZUKE/vz+qd6kV/OuU=;
 b=suh1aDwU2pMgLIQSoH45wmcHyddpkmgx3a+8hDrMWOuVm6clsNlohCv97XD961gqCSbS/wqzJVGjSTj7sJv9clfvwkshyZ6VNLGpXuEyov8eR6E4/HEpIgsQsPsPGgym//f0sQNMw9DO7QeHyu1679C/B4SIpgE+6CEwrTHRTto=
Received: from DS7PR05CA0099.namprd05.prod.outlook.com (2603:10b6:8:56::20) by
 PH7PR10MB7033.namprd10.prod.outlook.com (2603:10b6:510:276::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 15:15:52 +0000
Received: from SA2PEPF000015CC.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::15) by DS7PR05CA0099.outlook.office365.com
 (2603:10b6:8:56::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Mon,
 10 Aug 2026 15:15:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 15:15:50 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:21 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 10 Aug
 2026 10:15:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 10 Aug 2026 10:15:21 -0500
Received: from uda0498651.dhcp.ti.com (uda0498651.dhcp.ti.com [10.24.51.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67AFERW62648613;
	Mon, 10 Aug 2026 10:15:17 -0500
From: Sai Sree Kartheek Adivi <s-adivi@ti.com>
To: <peter.ujfalusi@gmail.com>, <vigneshr@ti.com>, <vkoul@kernel.org>,
        <Frank.Li@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <nm@ti.com>, <ssantosh@kernel.org>,
        <s-adivi@ti.com>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <r-sharma3@ti.com>,
        <gehariprasath@ti.com>
Subject: [PATCH v8 11/19] dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to k3-udma-common.c
Date: Mon, 10 Aug 2026 20:44:05 +0530
Message-ID: <20260810151423.1948224-12-s-adivi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CC:EE_|PH7PR10MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: dac4d7c3-9678-4b2c-a35e-08def6f2438c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|1800799024|376014|23010399003|82310400026|18002099003|22082099003|56012099006|3023799007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	gkoGvWhbaVxltpe0HY6ZcsErhwtDPAYX2igO3T29b6gZP2nM0CRrr3PbSXaLZg5VP/j0PjbD432MSqk1HBNZzGAlYiY1LpJll3RWY8WFVUK1JK7jnevXuMUwYFTPSQUVVBZN6CPkaUChmjbnjxpjPCwotsLuG5u9X4LwdVx9fDGiuTVf3oicfVqck/hCtCGs7PGonbo2G9HupSWF9JZB8nfcXjHbfWlZclwzf20iD33UBXINbLbd8a/eQQZ5jFKUDSIW8OUqDa4TWHMQU7G8kdtZeDupa50rP567k19v5R4CfWVtLCRXrh3uXlNe1vnKZD0HyvHi/4fube1WVSh83IzIrNYtWMY02E4qXxwnoF0/ptYkeZvmWSmvI9Ni52nSv9xYRrQqtPpz5D8NQ88+g/SlayPhqFRmuGiW1AwezfWJgR9LMQCZpf/UYRVGXNNfpgbm5/6GLe8cfopTaPRZz/NHyZSgJOliefQabq0OFxDGZPJh0BHUEKx04HKyUlV+hNRvXdgEd8uLcR5thfLH7cMsb+C9MTiauhQQn6wBVJFUtsnWLh5NIxzq4FWsE7CG+B2NO/Ye9kxUCSEORU8EBNpPYaDFjTJ6gwmbWflsfg8YQ0ApODXHHokP9DA0MbUV9VAWi+5iEnauW8bQQnN8QHeL+D5yMm5gdgaX4kFnPPmorSB+MxjSp2mAxgp6hKhNPRA0bV49AKlh+pE9MmoHo3Z9UdUtEqxb5bB0A6f77sDHn3muxyfJeKLKc0yog4lx
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(56012099006)(3023799007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UPbfPvxmAK7uk+AAjjXjgviX0P4EOa9jZrabg8c5AQoGiGoW7tD1fk0dd3W7ylDjT0WWiBC/gD9WDYnKtR6NIPAEgzXQIxQ7TTZ3kt0iN3U/Hj95c6L12vaDwVZ4YGYx/qxNMxL8QwtStzOo6TzwmB9Q8VaV7IxemATlp0iMEa5PPdAFVboRaiKMfcJKjt7cxmeW+ufuL7rY7TLGhCng1LyTbMvqqZtCjvMOPGK9yHdi9Li9Cuuiy1FC+XuTGv9vCY6koT5XS6olZrgfdGGIddPzffPCVmDsUFGdHqa3nRt5cdkr4dJzWbFVhDoSKxBXYIxeUHA+nWVCZqXgQVldMws/ifubVNlWb8zxq7NUoF3rNgZYazUjCH4YrBnvQh0e3Kdeay5NAwGFUUCvKXwyueRyaTLGARz9yq2LCDcpnDx9ZVcdvko9Pgn1Cpf4ntVd
X-Exchange-RoutingPolicyChecked:
	MLs7iCE92DMRQPZK8F7EUAhsKhIcic4rKLBG26wLJV460EDhGyQHtYpUhsN70AztXRmDlOMS6G+R/NLri/0wt3HqlwSMR+tfC46gMa4kt1b+bhOdQgWGWXCBAEZvha+ofP8gmXbVTcTA8lIIp4SXC50jIc+ua6mq5AciVIIKm6lZt478UDlBiAVRqusmErSn77UWcu4jMbPpOOoka7D0+RDdGFbbQ1GJqG64Z8SKJa1AwXbgfOjjGv8pEJ/ONuZ5b+PNRqS07NfXf6l2fSVQwV+wC7QaOcS1KOcpt1cGPnKC4mL4zxWYtZm+BXfSkFBQl/UQfUNlAzDmIeK9sVzibQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 15:15:50.8216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dac4d7c3-9678-4b2c-a35e-08def6f2438c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7033
X-Proofpoint-ORIG-GUID: ShFsdFN69Yw6DYUiOoWBiwPeazd0RlRt
X-Authority-Analysis: v=2.4 cv=crCrVV4i c=1 sm=1 tr=0 ts=6a79eb2d cx=c_pps
 a=Vy3FhvgG8Thl4oebyZnGOA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=tBjUjbL6H5YkyfA7LM4A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfX+RzJ0/LCHaep
 hSziuifu5NYvUch4Pj6KZ8UC9Io3nJZ8hnDohpwsd4biXaK4c+kjcmgE5Dyy4I+bvd3I/2Pvtfx
 id3w8Kza+nuUXSkDzwIWGIET6fQ3GzE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMSBTYWx0ZWRfXyrBz4o2YMpN7
 kOrNKnsB0EElGb8nQ99B7PNJi9FLMQ+cPGZlxrbM6CS7YR8VrLGOINBzb8Cg0amm4kQHmMCRbsf
 XtGchN3NoK5dvdWm11xhGx7IIcBaclmgf2Sz4FGP2WUa5gTkw9IAeTv93xC7UQEdonyr1T2gkmy
 +w35KaTyWT3dUyny2FQP6tNmVlmgd0B25/SmoO2yOPZgwKKSPwarN9vo0q5WwvXerwEJGbXpLLO
 Cb+qKlveW4o3lIasV+Diw2Ht0uHxWIkVI7DAvmP7nTxwhnmJK5ecy6VZVtq+cHz3H7fVCfeKbnr
 mq0cz7g8uHt5iKxJCqsKHzv3paykDDVMu9agTL80T4uIRtSG3t4+LZpt8WuGT9rEzaosjNq4PAF
 1r318BoOF/JJ/ibHMMk/8VNbN+TrwA==
X-Proofpoint-GUID: ShFsdFN69Yw6DYUiOoWBiwPeazd0RlRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100131

Relocate the #include directive for k3-udma-private.c to
k3-udma-common.c so that the code can be shared between other UDMA
variants (like k3-udma-v2). This change improves modularity and prepares
for variant-specific implementations.

No functional changes intended.

Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 drivers/dma/ti/k3-udma-common.c | 3 +++
 drivers/dma/ti/k3-udma.c        | 2 --
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/ti/k3-udma-common.c b/drivers/dma/ti/k3-udma-common.c
index b9d3cac5eb9d0..01b66e9f026b4 100644
--- a/drivers/dma/ti/k3-udma-common.c
+++ b/drivers/dma/ti/k3-udma-common.c
@@ -2535,3 +2535,6 @@ EXPORT_SYMBOL_GPL(k3_udma_setup_resources);
 
 MODULE_DESCRIPTION("Texas Instruments K3 UDMA Common Library");
 MODULE_LICENSE("GPL v2");
+
+/* Private interfaces to UDMA */
+#include "k3-udma-private.c"
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 9a261747c8709..ddedd51ab26d9 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -2857,5 +2857,3 @@ module_platform_driver(udma_driver);
 MODULE_DESCRIPTION("Texas Instruments UDMA support");
 MODULE_LICENSE("GPL v2");
 
-/* Private interfaces to UDMA */
-#include "k3-udma-private.c"
-- 
2.54.0

