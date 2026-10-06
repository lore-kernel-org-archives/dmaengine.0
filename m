Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B419224AF2;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248590; cv=none; b=HiU1kWku8GqFjLSTUZvy70ACEPZlrO7a/v8blvz1VzBnMtxbLS4BHiXhqdVoky/yY0hZ0IV9KHErBxbrmqr7Ma7yrXMywM6tKSUWqGoHKuRaslTBEbw48wfTXAmQyRLP8g2Jeu7v7wT1LUPq5KcDk0k+2rbzgaVgFDpzb1tcrBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248590; c=relaxed/simple;
	bh=q6zvfoT0mR5ksyINAvycpPFkrs7j+4lxE76e66R9NgU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nNu0ILfaoM/mhMTJ9WuKP8sqxkYrTweyAxU0i/KjzncAxS4jUZvDITW4ZZldNkBtBcJCo0YSk3HNf5PqHtDW3xApC+vM/2ydjAGEic0Br/MSHinBM6CzGneIDBJgfOBCr9KtxGFcMju9J4rJJQMRQ/3NzBUalsLEkrwnYb37WaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sok5pmsS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sok5pmsS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15A0CC2BCC7;
	Tue,  6 Oct 2026 01:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791248590;
	bh=q6zvfoT0mR5ksyINAvycpPFkrs7j+4lxE76e66R9NgU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Sok5pmsSKepud7jUUemPeuDfDUIizV3AU1vSK1fL0ANdFZAshG8mBXF3jg9/P8OfG
	 WnCmTmwamRgZgJPWPxvTljjxtgsjHN7OyXpo83PPqPoZDRvxg/fC6IbYar4Lo/uZLk
	 TOx1T7pQow2635mvWVWA8+IhXNb/zFnuws5TpjZpJQnY+lYsRlU5nqQEzc5Zh5+SSj
	 MOJlLIllo7S+6OEUOFY2kSB9SvYb9luEbdBgau+rJ7jD3XrttCLjjGsvHt/CNC2/oq
	 bpRsS1j02MTI0Qu8kXmIVgTQAwu2KWafrnjGCzWU352b7uhzJzWV2UIlBmXHAEc5Im
	 ragOmlmUi29bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBDC9CA5FFE;
	Tue,  6 Oct 2026 01:03:09 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Subject: [PATCH 0/3] dmaengine: dw-axi-dmac: Fix LLP search, error
 reporting, and error dump
Date: Tue, 06 Oct 2026 01:03:06 +0000
Message-Id: <20261006-dw-axi-fixes-v1-0-3b319e456d93@rivian.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMtIxGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMz3ZRy3cSKTN20zIrUYl2TNAMzs0TzFEtzIwMloJaColSwBFBHdCy
 EX1yalJWaXAIyQ6m2FgAWORWdcAAAAA==
X-Change-ID: 20261006-dw-axi-fixes-4f066a7d9720
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Roland Dreier <rolanddreier@rivian.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791248589; l=1092;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=q6zvfoT0mR5ksyINAvycpPFkrs7j+4lxE76e66R9NgU=;
 b=D2nI8YN73HxcoAkFzmSupL94iDZ3YwKRINbA3myVuu6EOuIAxhOXmoI8OiZQOgv1tjiF36bNQ
 bsnVnpbtRhmDzJwq0X/qdleZ4jF1hjLXKRmvi0QuUjMn8PYfN/Yrktx
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
Reply-To: rolanddreier@rivian.com

One patch that build's on Jia Wang's fix for error-path LLI dump: the
same bug is present in axi_chan_block_xfer_complete(), although it's
not clear that it could ever be hit in practice, because the llp being
searched for should always be found.

Then two fixes for failed transfer handling: one to report status in
tx_result so that clients can know when a transfer hit an error, and
another to make log messages more informative than "Bad descriptor
submitted".

Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
Roland Dreier (3):
      dmaengine: dw-axi-dmac: Bound the cyclic LLP search to the descriptor
      dmaengine: dw-axi-dmac: Report failed transfers in the descriptor result
      dmaengine: dw-axi-dmac: Decode errors in the transfer failure log

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 56 +++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 6 deletions(-)
---
base-commit: 67f0943b394d920b6c142aad8c6af94340342ae7
change-id: 20261006-dw-axi-fixes-4f066a7d9720

Best regards,
--  
Roland Dreier <rolanddreier@rivian.com>


