Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863749;
	b=PKX+eIPaNQeNdbLISw+8xDlvwMzZ7PeUemk6hF7ziyA/TTMX9XtTk2jpRJeaJKEQxeC8
	 eXivDq6ywxblPEedculdFUQBl1az6mRISvSfdOpbV6YoPS0M205lrzspf2Q1prLpgHtSA
	 RUciNaL8z6k/Q2iLSb7Gc5fBHOEMLRs7jqTgJ28o2hwYgLaX5H4DRw4ICr8Ff5bbtSNH1
	 D2WYRUlkOddW/zSgSXoaNnzST/dIc+EqFgWsRz7HLUqtVCqrVhNNVmFdbpFWIIx4fdwL/
	 pFftGJWfbYuayy+g4OMPRrt/ufOl16tRuJchOHHtl1dWNNJowKIWFUWWzQHNPRsQNAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863749;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=9UmdjfKHAsLzNRpNcqYFS31G94ZgltaT+tGvFlmHSh0=;
	b=eLDys2buTBbJLIJzE8f4i2PKUrol843OnQDi7Stsp3CaO14RpXRyk5HfnOaCVBrv4wsC
	 KkhJDEmywI//3cFYtHXCjySWfBBqtL5CfkagVXszot41DbTn61LnABEy3ZkW26fFBIonQ
	 G77+t41bfyN1hb6huy1w35rekg4iWZsn0JZAhyHx3e8yLq/+JwTU+9rSJIAr6hZREa/Qt
	 S+sHzxt6AZg7FnJz18kA5vG2qCJJXxFtlKj4Z3ZsHPAt6gTiB8YOf0BrBt+HjOhToLgAl
	 EMwdKTcOCQ4FyElBaVUUkHRwDOQ8GrXTJladI0F3k9y3K5KxzcDr91YgQKc7zv80xbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fFo+znIA;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361EF606A31C
	for <dmaengine@vger.kernel.org>; Sat, 28 Nov 2026 11:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 361EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=fFo+znIA
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652a9;
	Sat, 28 Nov 2026 19:02:25 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vigneshr@ti.com,
	vkoul@kernel.org,
	peter.ujfalusi@ti.com,
	grygorii.strashko@ti.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/2] dmaengine: ti: Withdraw DMA providers on removal
Date: Sat, 28 Nov 2026 19:02:22 +0800
Message-Id: <20261128110224.875369-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa221d211df03a2kunm94af19d73cbc5d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGhpDVkpPGU4ZShgdTU5LQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=fFo+znIAP8oF7fKe0YATpsR6FJaNxyim6LxlHEsOPZg/b3V5wUT9nxHNvLGNNAPAFbCQgx1eH/Qe/iPMXU+TOhQLgoIqHFpg2e3kbOOHmUNEQd+kShXWKHD1+bchd9VWkuiFEvvqFMb1ODUyxPW8bQfDXlMK/7tFbLEIWe6MVN8=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=9UmdjfKHAsLzNRpNcqYFS31G94ZgltaT+tGvFlmHSh0=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Pair provider registration with removal for the K3 UDMA controller and
the TI DMA crossbar.

Tian Xuechen (2):
  dmaengine: ti: k3-udma: Withdraw the DMA providers on removal
  dmaengine: ti-dma-crossbar: Unregister the DMA router on removal

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
