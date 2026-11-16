Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794823571;
	b=HdXFzTOjOk6nfjmNFESM9z+wS7WiU1DVAk0xdb+jgE/7i0Ea83Z1/Ot7DXkCwSJEKWYS
	 9rKwurVX1WBALMJq/4Dow+xXcJVhp+ZLcMs1iGBywx1/VVRVvPuxR475TJTW+jWvNCr/y
	 ZXjN+nOxb5rqtdWNnf27s0+LpqxthXUDzPdTTmU718LZYDLPjo96t9e9CmpxvzxiLB88c
	 Q7lUNNp8JZjJuhNIsA5zDDovfvRVojYPYS6RedC9nvG7JGDmVR6nHzzr76yJK8AGDy8jU
	 HSItF7R4clL0aVmx78tKv9Y5mCYo8hwrj+2aJZPHlGB7wAITF/9z5KXTZ9vybHJZphg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823571;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=6bO/b/Vu0ziY07A3XZIEbldvCisJeCASyIhfTlyo4Ak=;
	b=OY7vNsSaqc3/Q6BxZxZn2SlOzftgQamp6yeuxJk4DDcXBVotgl7i0ug3MHndoROt/xZ7
	 Nq+KY5Ir5ELMiXdvrOEZgzb4hqY26kYec4OtftdDXbyWu3ThqTAIA6vu20NclWs/5brRj
	 slg50CkH7fCazkFc3TVTkacBn6aF9CXPNVWGOeslQw/eKFr2Gooy2tRaHbv1tSrZ2uaAH
	 Ym/xkcjNRr7ZmKkbyCAR+zLji/Fn7CJxBmp+ITM8qnLUW6TyTCGdB4jCPUZMmcerWHvXB
	 48euKcwTi0+A0j8+2y5XdjW+ycyXb4CPpveeqRXRZCyuy/mPQcWPDy25+I014eqYMFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.94
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022094.outbound.protection.outlook.com [40.107.75.94])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468C606A31C;
	Mon, 16 Nov 2026 10:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A468C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5WY/FnF62f6Lv4D0EtqMcg6eP625/sKSuFgTw7oGWlzY7bxQWZE5iV/x4wd9Pv11gpcDY5XQv568E5xRKxM0AxRNnOLI7hX3GEKsqpwXFMjYR6wOmmOKKXd0jh81CS0HJAAUpj/BgRERL03AGlhqKzKryPcbuORvNRqoJUBBL1waDFCOlr7jZwGlmSn+Pl5K9E+NXlqq5LuoxnA0qjQ+95ta6jYe3WbdBUAqk337Oa9d9q0uqjqmX4fIRRjqdA37YIU3Cogn4HEq/so8V0rcjJmBd8T6brYfMYBAynl1olu+DGMHmVyt6u/JkYfz/vUQ68n9DRFEbGAu22duhSpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6bO/b/Vu0ziY07A3XZIEbldvCisJeCASyIhfTlyo4Ak=;
 b=X8eklZoF5qrSbGBC8HWddQD34CWmRC6ZHiGXlDZ7HX4dTPy69MM3WASE/RO8JpwAj5BSkwUyDI1oD0HVojmjuDoPpyFXNLtqgGz5lmqz66La3A6NiQBChPnmwUrRDFReFnYdB098y6K8YqrS5GdO8eQVUfvMWm7cO112XF/Yr5DqfsCWCNhGrpJj7YabxtbkpQlKTjxKjsjWQldXqcrpt1vLpAj/C7JEneBSxUE/i8K+xWhvdKWGXl+r+gHoeS7gCjzDM58+rEgk6+cTcsCFU/7vSVpapVN9YU5AwVZsGNryYkGsYtkrkjFQqgQvce/OWTbEExUjiPA/QnGzD2ceIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0010.jpnprd01.prod.outlook.com (2603:1096:405:26e::18)
 by JH0PR06MB7053.apcprd06.prod.outlook.com (2603:1096:990:6a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Mon, 16 Nov
 2026 10:06:06 +0000
Received: from TY2PEPF0000AB87.apcprd03.prod.outlook.com
 (2603:1096:405:26e:cafe::46) by TY4PR01CA0010.outlook.office365.com
 (2603:1096:405:26e::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Mon,
 16 Nov 2026 10:06:06 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB87.mail.protection.outlook.com (10.167.253.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 10:06:06 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3C29240920E2;
	Mon, 16 Nov 2026 18:06:04 +0800 (CST)
Date: Mon, 16 Nov 2026 18:06:02 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v6 4/5] dmaengine: arm-dma350: Support integration clocks
 and resets
Message-ID: <avrViuk+SH3PTR5S@ubuntu>
References: <20261106013453.1134239-1-Jelly.Jia@cixtech.com>
 <20261106013453.1134239-5-Jelly.Jia@cixtech.com>
 <avYi_uctWPVo4mjn@lizhi-Precision-Tower-5810>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <avYi_uctWPVo4mjn@lizhi-Precision-Tower-5810>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB87:EE_|JH0PR06MB7053:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d85321-c7fe-4299-75c7-08df43c93ad8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|1800799024|36860700016|23010399003|56012099006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	N0CwJxb+KpV6xgNVRZxznqRwLABdZadFo3MzHJYEVH0Mq6TLd5lODlY4uC4+PaI8JmmL/yMCBvuHmLCty0vUZgPhpc6YFne+G98TSp5uupMIpiD1NbZWaZxEljqbjqWAqaGoN0fhOjCvFBZ4oXkwbw9l/xLZAQVEyJ8wR3sGKmWmq5hlTZ5rtkFU2VMpv/1QFXRH6FrwKTr4vO8/XnMvZCOpOvyXOMyuk8tLSsrynnqSpFmNCuBySdDB9yQgb9umZtEkb+G4WEQQMeaym5cd7YWVIw20ZE+1sIvAyVhlkenqqqBA66w6Io8KEcjfWYQJ4OuD1kdhep1PC6ofAufyViclteuwVX6x7y784eKFzvCHhj5o6Ng/CryQKxQNsslhlUf+oCU/11V6pSWP36nAyVacbZOEU/QcNVWC4bpOAgFZ2XVRj2P5+lH4IKGGj/6h+Pg/sQabcSN8vgx9UWu+PSMkL5Dd33Z2l9Kphxel1mLNciUneFhTzDmUksjJ8w/P5cLjo9YmPmLdpGa07XGjF2cRoRSffZ3n1mYTF8gkddd0WJUunMWmnZSVGbpemOggIy26UZTpkh5WHLedSSOHcWy3WuexZjlTMSuyg4fipZQ020GagRAON9a3KQv4kcwhwfnCOOOyFR/8QaEEadcjopjkQiFu0PYrXB9OYS1QSruYm34NbumWgQnLVpjDSLbh1n2Ta4mCVTVeSBYqnbwxdQ==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700016)(23010399003)(56012099006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i0rrbHhH5rBPuSoZw3qdLhbBXCib6KDo5m7/AMUIL5dzA6dW+qXSRYxufLY0J8V7yrgBFW2VgPN5DHIB7zl3vjHiT0OSwVayb3fkpfh6HozF/X+nU5ku9QuHTSES09MgNZaIBaUqCA5pA5gpesd2Ha6PgDkRE0rVw4WFC8zT4uQP6vekpgV3bcmaqRQ7LGxX2+YKHc80ysS9Hi6UpxLtYLtVF37aykJ56ova1SOLPyepEQ9o2uoW3L/KgYjKiqOOaq8phdXTd3IFETTbgPnFc+F5wrLtW/an0X+n2+uDoiRjsraIEaCAcaFbLJkbhP5D+7sx7E5c+4JGNrNT16mpgq13d6CjrWSJLYNTewNnur6S3u+gMcex3Jxo0+j7il8HvCiPFEKe9AufjmtmM3qxH1+YiCgU0cheKVA7pYyYd+vd6Y0tKNIs3gU5TBMsdfff
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 10:06:06.1892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d85321-c7fe-4299-75c7-08df43c93ad8
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB87.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7053

Hi Frank,

> follow b4 order, your s-o-b is last one

Thanks for pointing this out. I'll put my Signed-off-by last, after your
Reviewed-by, in the next revision.

Best regards,
Jelly
