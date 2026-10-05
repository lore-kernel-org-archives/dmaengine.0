Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43FB4D5974;
	Mon,  5 Oct 2026 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215009; cv=none; b=Ys07PKg9DkdiEJliU3pCJYDf4vB9/sbOKr9aY/pRCPEQbH/HHd9sLU4ediHv4A5sKkuqGcYl/h2GgQEJ2xiXsvBO9yHkUIW/asx0Ml3U4aMadd6oY59dhAFoV8cxnP+B/Qey5EjsnmwjwTvmPPYhSuX4Fs0Qfnl/vzM9MlXYENA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215009; c=relaxed/simple;
	bh=aEb30S0VpNW/W5wSJTciNZeQlFAFdKqun402WeND7rI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PQYxMcLOCfykJGOTJAU8LRVdrZV5dimaIA8TMppPzFSqGyu01NtBi/Xqg4XDwLXSaFwI2No/s5i/h1X7hw9Nha3CEhaR988OvYMJfGQtBhhk04BGUKaDdPIiif9pNwadmXdxNZFyBW+SWIrD1825hZ6Y04Mbp5IVUawNjHf5UrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DXik+ztl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DXik+ztl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9901F00893;
	Mon,  5 Oct 2026 15:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215008;
	bh=8DlIKj7jO7jqn1va1Bn6lXQ5MWKlFIDzvl6eRb51k08=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DXik+ztlNzFxuQmBbL1M94ngAD1VT7eoYbgATclZTHrwmQMDvMQdUjG258qY+gbul
	 RvyI9tJ8mC6MPLUnZW6zq6wxu5Tq6VQJ5wWSVg6uWgcCJgWXRHJwwEobkmrngvvWkI
	 yi5RlcB+fP8oYxli0WUjkSMRMoRshOCcDsPRdB0cyyNI3Y4EcMBXjR9CLqXo0gRRD7
	 fL3uAJovDmar0zztlbNFjC4r20q8uwjibZSQyttpJzAIFswOlo+Uf3Oh4O7ROVkzIT
	 KlZif+RpZ6eMGHMnwS1jsiKMLdJ0zFRZyAAUWNY2qLc2YbYzpR0B4LETn7mcmXr15y
	 +5CFvlyR2x2dw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260918175950.21657-1-rosenp@gmail.com>
References: <20260918175950.21657-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: bestcomm: Enable compile testing
Message-Id: <179121500730.358863.14325828175484264801.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:27 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 18 Sep 2026 10:59:50 -0700, Rosen Penev wrote:
> Allow the BestComm DMA engine to be selected for PowerPC
> compile-test builds.
> 
> The freescale ethernet and sound drivers now need a dependency on
> PPC_MPC52xx as they use headers/functions from that platform.
> 
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: Enable compile testing
      commit: 57946765c242005bdb16d17944c27662c8c5b013

Best regards,
-- 
~Vinod


