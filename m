Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699691;
	b=fTCd0xA1TjIUTsSyjItbwpocf7G/owLbq45zr/R1JriLiC5XbqlesPMSpdla1ug8QAx6
	 MhUnhCgt7wx72hra5zK3jcrtWyhp9gTAsBRoJ61xpLaRqZOLLnz/RHC8K77LtSes+LX7f
	 ddXCvhyAX20eMneyPIEj8JTWRlOOVUJdWhpBEO9v8t9KSzSloKLRtgk65yIg+CPal2ppM
	 Ku9pnMp90/bLNRGYxyhOJshZrLkGJ69cZfKawBZXuc0gWNXdPrKPEXJ9k693nMoUw/qL1
	 LRmiPn6Opa+qZlOFvzVmBD5lyN3ko6Gtxwmm9GbFgzahflPszfHRl9TcJfEfd8sGObQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699691;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=39aXfXJaj/hKAWo1P21hHRJATdJb5Rs7OG7RxKc4hF8=;
	b=VCHWj1RE99agk/4op0qD7ddie0t2qQXCnHpZ4lsneHt6YcnlN5BRhqb/uPT7YgMmrRDr
	 ImjbUbIm6/FuDo2vlSrzd0qy4uxnjQCcgBvd0oQN2gWkZdeKvSWV9rAKhGKpmb8bxLfPp
	 OGRt8hbSxQyPiAIrhlLUk3eVU3NVZt8H4FJHIqnrDN29jtNr9/r2VuedChW3HYrfiAAQV
	 mV7PYbn/4LtY2X90/dGkseNarJvYPNDeezhzsb+mHb01PtJU4AHCa2nbrFgXOOUjtbSyT
	 Z2b9M+bpIvFz5phVtCM2gZ8m+na9IOeUbXBZ3a5/6eY7mPyTleFIDNOlppphQl6jbng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=WTMp+1TD;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E93606A31C
	for <dmaengine@vger.kernel.org>; Thu, 26 Nov 2026 13:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=WTMp+1TD
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 561f6fcb6;
	Thu, 26 Nov 2026 21:28:07 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: vkoul@kernel.org,
	vz@mleia.com,
	piotr.wojtaszczyk@timesys.com,
	manabian@gmail.com
Cc: Frank.Li@kernel.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/2] dmaengine: lpc: Unregister DMA routers on removal
Date: Thu, 26 Nov 2026 21:28:04 +0800
Message-Id: <20261126132806.4091183-1-202300460064@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa2180abfae03a2kunme5d0c11035d95d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCQxgfVk4fTh0eHx0YSUgZHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlLVUtVS1VLWQ
	Y+
DKIM-Signature: a=rsa-sha256;
	b=WTMp+1TDotC5W7xTuPrRzm83WJnYqsdlCjo0E4XBK+/WJ/XI5LKCTD/O7hn0cO2/BQpk354pemtXRPF4A2KdLnlZCtBc7NqJudyo4eKIruptlZ+CGxtHQNPozswWrhWit3WOo3lfQvYUwohCquyAh9YdrnZzZB9Zy2bpz8/Mzm0=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=39aXfXJaj/hKAWo1P21hHRJATdJb5Rs7OG7RxKc4hF8=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Pair router registration with teardown in the LPC18xx and LPC32xx DMA
mux drivers.

Tian Xuechen (2):
  dmaengine: lpc18xx-dmamux: Unregister the DMA router on removal
  dmaengine: lpc32xx-dmamux: Unregister the DMA router on removal

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
