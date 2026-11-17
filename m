Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.99
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908623;
	b=MMGcicYM2h1k0Rh66PUOLqeyq5BkXbW4YehKp2QxPaaXbsFOFNynkDVU0LpnvdVFi39z
	 7ax57G2ohXx4tth8E1Jb5of1hL72nimmb2g5hfLFkR6pa7fxAWLmdwk5xKEbbnh2kkqGx
	 bxfPlKTyVnw0NSpEN5BD7omjHv0sLeCkuYPp2OKbvIZo4PCBv7nm3wc1z496hF2rnqiax
	 rhKDMwTYBByiKOhS81jqY27usUlA3WODDsMvrbcmYIPNYsZfB6QkIWp1nWGgTQpecnsmO
	 bFTU03BOkcCjTxiqMlKImwzo7sWfbnqe64H80O6fn01pvEdvNIhA8hrdJUyF5TN8Glg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908623;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=aXSpH/MRstkp30+5WcNoVFHY0IbutKcDkDgC9PrCYak=;
	b=gtAvMcVpWHpWUW3AHk3vIX8q/egdCCWnniRqcbgkjvAW9T+O/Vmn7tlhaPIoRlhCPr6i
	 MMGXM/QE54pCDGj5nXA7jKk6nMTvHXHvDLThmvNM1xvi+I3181DN+wtT48aTvnhA0ayQ+
	 jd8ceol0HraTPP4WLu+3hx41DX5orNTc+Azo4gJvdabqnaWWRgfBQwTvsSxNZ14U6SWYZ
	 UurtOkbvu/mbWp8BrNIRqYFvDNTM7BHLLBD/hdasgYuOJH4f0NGN90t/0YLmJ11Zge3Yl
	 xXzPhrHNhw5gTZhxHsyU1mUvR2k/+jy2eOUb9shd097dUZrOuGpaM/xNiNJQBmhwPjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.99
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022099.outbound.protection.outlook.com [40.107.75.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB41C606A32A;
	Tue, 17 Nov 2026 09:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB41C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ez/U65mR9Ebrkf9AiCYDXuCJJyEyVv7N/kcdqD73KsMvy90MeHxvVqz2gssPYSUv4FbggX+y+0O8ENYrWN3S2hacIBKH2QY68HTShhOYykQPJ5wpk7RgUB7Mg2Vv2nbXhAHE6JQ/+/RBw9IeFCYqqzSQ4lu9YPlWchTSWhF1bEzQbpLOT6r+/llC675ADhwC9gIa7MGixPN2BsBCh36YxhK3Ts+gWLATsAC3KWPrB1GQp7Gcb2uvCoTFY0SQZFlVcC6T5pTzCc5w0yHsTFuSx2hbwBaKj6usG4ErLnkUsGV8VmpoC4UqslSxPkVi3cME5tzLaDPL9eBMfX+Mv178Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXSpH/MRstkp30+5WcNoVFHY0IbutKcDkDgC9PrCYak=;
 b=orxnc/TTblbpRZbs4bY3syiMYiAo7iRt4RIlzoKppYVB860eVSxXpQLhNLYQdMQV/CrzwVTTij/n/MY42FlpVI4K6DLtaVAf78MbEmRxab4arX11nTTuPsJim41B7BZECknB2p0/AYgQcOdCNx4rf6Ye/VXwv/NPaV2P1iPMn80qWCCMvGCRQJgOltgKjBs8IOztagMOpFs6yhyequYBxG2t0+7+YdicH7GnH5rT3XvQ2Hph4EUUV0QY3RbqMQoVFsZep3E+VWN6+z8RO3kwB3r29r0UnMTzXVKEbkrfeOyitXiPxjwF9ezRJz2YuudyUtz72uWR8eDBo170JSoCqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) by TY0PR06MB5103.apcprd06.prod.outlook.com
 (2603:1096:400:1b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:43:39 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::93) by SI2PR01CA0046.outlook.office365.com
 (2603:1096:4:193::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:43:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:43:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id C2C1840920E7;
	Tue, 17 Nov 2026 17:43:37 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v7 05/10] dmaengine: arm-dma350: Report submitted descriptor status
Date: Tue, 17 Nov 2026 17:43:30 +0800
Message-ID: <20261117094335.1393735-6-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
References: <20261117094335.1393735-1-Jelly.Jia@cixtech.com>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|TY0PR06MB5103:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2f9e9c68-4385-419a-fa17-08df448f41fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|10067099003|56012099006|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3XELKxg3SUHKbV3cK/3LPIW3ZZ7Yzw727o8cBq9aTSBdgfPzpMuR5I2/gSBaIq1qJadYqdgdpegUHkrGwd2NltmQZyLAS7EKN9zn0rZ+dIDIkj0YJpGqG+wlO2OQvQ9n1LMvXDlavDqssq89e5HcbclLKayiTo8PNvTBiKZXdK+u9PJs/N/IslEITp7J7mbgQ+wxvmqB7KxGjHGsbL95p+o4iv92eTRIb9uouGdriZYbwWCka5tO8YJTrBPTikq4MKOpjkPa1uaLsgiE5+fcJ/h/vWvu7ypwj9r3771uFSPnesnfabS/AO8tSqw4HgYGjwDZkwm5sNG2Gq5K0lKeqztapXx4oDQDn4EYtMO+/1k0pQn39VHx9JVhQxHpoOUCg50q45U6OICnpGWo2g9RwgsdT3L2tMGL1uSreSmFvDL4k3aH3sMScmYZfVFxDzEQkPXlgNesJvOpI8dqfovwb9Sa4HvfX6AqPjqs9NicMxIQM5S8GI1el47aMvXOcUe8oR7Kj5gtGqDkA5rzzbHBtskPcXYCoBXhtj9hzuJXC/uDuCC59Y90+iEUc/IkMWeUptbM+rqvNtSWF1G/4uw3yM6Jcm1UzdS9ycKEkW9mydSG+NUtw36QOGyO3//zto94TqFDIiVsHjARyCWLjgUAUw609YFfzZI3Q/CRlzkUyEa5HqvrsIl+2109za+rdZgvk4IN1E3TNVkjA6NqjZe7xQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(10067099003)(56012099006)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	et5z7dTsUJu3vaADnrP1OjLUxUHa1gvcO8Mk4dUC52Efd751wGMhkTrl408BDTZWbcqUurMUp0cSzHj1MFTCa3bdA0M6+MOt3JGL1B+i6M3Z25bQC91TKpfM/B+o+bCEr/FeDSpdw3KCu32QRbZv+INwS21nFitpVf/LaWY+MMTXCGcnFDpUcyK7pT1Md89ArJsI737owlOejum4G5iQSgNmEZmhSPXUWl+xvVSctL7+d4tVzj5QH0SaatAkDz9bpr7UcbXL5LETja7jXCXz0f/IdJyUJ/giKUocA6SFWKKWSqdaKHQ4ySnM38izZFbn2uh5r136nBG46I/INvl+hXzZpPk8Jv4wuh/SexvhsoTfro3155u5bIkAPb7R6Ne33Z7xO9n2DvJkZT9lG07LSvxtjBl/yTdxEyUvfrqUN15Ik7xT876Jg7xFr6iLWF04
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:43:38.6359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f9e9c68-4385-419a-fa17-08df448f41fd
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5103

A submitted descriptor can still be on desc_submitted before issue_pending
moves it to desc_issued. Searching only the issued list misreports such a
cookie as failed.

Search both submitted and issued descriptors when reporting queued work.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index af1b030b955f..f785251935f4 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -390,6 +390,18 @@ static u32 d350_desc_bytes(struct d350_desc *desc)
 	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
 }
 
+static struct virt_dma_desc *d350_find_queued_desc(struct d350_chan *dch,
+						   dma_cookie_t cookie)
+{
+	struct virt_dma_desc *vd;
+
+	list_for_each_entry(vd, &dch->vc.desc_submitted, node)
+		if (vd->tx.cookie == cookie)
+			return vd;
+
+	return vchan_find_desc(&dch->vc, cookie);
+}
+
 static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie,
 				      struct dma_tx_state *state)
 {
@@ -407,7 +419,7 @@ static enum dma_status d350_tx_status(struct dma_chan *chan, dma_cookie_t cookie
 				dch->residue = d350_get_residue(dch);
 			residue = dch->residue;
 		} else {
-			vd = vchan_find_desc(&dch->vc, cookie);
+			vd = d350_find_queued_desc(dch, cookie);
 			if (vd) {
 				residue = d350_desc_bytes(to_d350_desc(vd));
 			} else if (status == DMA_IN_PROGRESS) {
-- 
2.54.0

