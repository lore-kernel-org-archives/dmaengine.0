Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7B5403123;
	Thu, 10 Sep 2026 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789043657; cv=none; b=jkQ87Ck4WFGyA2z6RonWR+/DRC8BvgG589llXs2dD26LzomfDDMzMqBwfngk55uOAQsceUAyMwPVRdaTDpXDztM+X6BX0chDSVySW0yHjAxa7mXlNi9YPi9J3P/q9Oxg1AK5PG3iQ28lF9yCGTlZnaHxPgJzSxRLOZijL2rWJEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789043657; c=relaxed/simple;
	bh=AFozQUaJRUgLQIP1V4fLx0fDeHZLHt/pHcJNIzh2ewc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0akHE1uqWcEfYEVzwHHrX83CgC5T4SzvNrI34SVsNV3M2Bx/KOxUJ1dQmZbE9beAZ/GKe1LOAKJBqpTRKDo9Sw1mbzPTZTKdOS00ncJMaTNGbF4qNvFF9AXdPykkudJh5LvJ/q3Xp/9O6OhkJ64+iATuHqSDVTFFxft9fMn23E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SFOwRrfq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SFOwRrfq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A02D1F000FF;
	Thu, 10 Sep 2026 12:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789043656;
	bh=8kvF2/AhdTNUKn3alt7GoqvvoSJQY4pGwpfkfo5Yhew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SFOwRrfqjMORI6VJXi9dIn9HiZggnYlbQAF3RMmdl60P9ZEpNszWoDrPCjk9TrOsE
	 qBWuYTLz4YO94Mwa9muHSYM7j7dfk9YKDigWntGCfC6Z1dym2Exgh6Eb5AA/uaBkc6
	 f+WCVt2YPmPlDxDK5/+/FxphtMVnErmhAHGXVlUguB1kEKOpYZ7q1W18VnNeMqgOT0
	 R/LljO/mgQ8pU9tITLugjg0mv/0OSPvV3xUHH6kGakivDm5j314cRqjVq7RwlRXPIe
	 rCvJVfEK0x8kDo8OzSFg4kpkPDbWnAp9LMtx9qEYEu72G6RrfxLCx0F6Ww+m83j1P9
	 eOFGJGF9D1SFQ==
Date: Thu, 10 Sep 2026 18:04:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Frank Li <Frank.Li@kernel.org>,
	"moderated list:MICROCHIP AT91 DMA DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv3] dmaengine: at_hdmac: use devm APIs in probe()
Message-ID: <aqKjw2k25mX5o9BQ@parshuram>
References: <20260817201200.10952-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817201200.10952-1-rosenp@gmail.com>

On 17-08-26, 13:12, Rosen Penev wrote:
> Convert resource allocation and setup in probe() to use devm-managed APIs.
> Simplify the error handling path and removes explicit cleanup code.

Hey, this fails to apply on the current code, please rebase

-- 
~Vinod
