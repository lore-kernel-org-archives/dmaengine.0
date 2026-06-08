Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7937B022;
	Mon,  8 Jun 2026 12:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920794; cv=none; b=nasMKDGobHE/PdDoXuvzDDRhNZg0M/ZefJQYACbuaXxP55wqBJI7nN7lzUZ5RDtGhDIL/HleZKMN6eT6Suz/XwFlNqBZfQdJkrQqW/qVnnECDBdjio6GDGWBrVBzBBt8oqrWv/qrugSukt3jxuHvgJGNTUEXSEi8GXpNCfSxhtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920794; c=relaxed/simple;
	bh=b6mMV8Tn/OgFfeHKJy2Ivpa8WxUyu0R+c4Hzn9y6I9o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TuZcmbwrG3N2thDciZ3PUuh5008K72RbDZ5gP3HB3VH+4DYyOEhXUMpaNijc5G4yp178r/2HsFbzaZFIka0G5FHvnq4njBe3KysGJ3iH3j7MVkX6kpCQKnBL3etraulvf3/7wtuCS7NIkGtkpgnlZ39K4fQzL7JDocFpZU6YtXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RDsAh1RQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RDsAh1RQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A926F1F00893;
	Mon,  8 Jun 2026 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920792;
	bh=QvA/My2GisPFG79WgI6LJ2+9HPkay/hTnBLM2CFhnlM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RDsAh1RQJH6f4RlIWeDD1460/9vwoyFYEFDVESZ+V2UlQdGV++XD/M1dETR+v9nJA
	 D6GteQcKo1gTTJDtpKYhEPMzqOkAxjRqAhT+lk1q7G0TIUrxePhSQW1WyvFjACSwMC
	 vJwQgJgzUnfHnmTDjl22eK19k2xK27jF516GNKNwG02mC1b/fMJXAXkpiD+qlXnKlb
	 MEekG+dNjP5hUomKfYGaXtyBeM7R5Xg2nbbNNGsLdZD7UDh36DEM5ag1+0dfx0+NOI
	 iXtKrSoOO3zQvFjEvy/VjEOzb9yCf87Yp8Uy+zxVCRKEEFPLGFg2V4h+OZVU2/3lEW
	 6mEkqN1C6zWgA==
From: Vinod Koul <vkoul@kernel.org>
To: mani@kernel.org, Frank.Li@kernel.org, 
 Devendra K Verma <devverma@amd.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 michal.simek@amd.com, devendra.verma@amd.com
In-Reply-To: <20260526053111.3244488-1-devverma@amd.com>
References: <20260526053111.3244488-1-devverma@amd.com>
Subject: Re: [PATCH v2] dmaengine: dw-edma: Remove dw_edma_add_irq_mask()
Message-Id: <178092079029.96550.4461285386289829094.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:10 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 26 May 2026 11:01:10 +0530, Devendra K Verma wrote:
> Function dw_edma_add_irq_mask() sets the mask of the
> interrupts alloted to read / write channels in a variable.
> The mask set for read / write channels is niether used nor
> this function is called else where, making it redundant.
> The redundant function can be removed safely as it is
> not affecting anything.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: dw-edma: Remove dw_edma_add_irq_mask()
      commit: 57e766bd3ddb2495d80952ad4fc723fb538e1d43

Best regards,
-- 
~Vinod


